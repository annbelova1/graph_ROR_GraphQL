class NodeRemover < BaseService
    attr_reader :node_index, :node

    def initialize(node_index)
        @node_index = node_index
        @nodes =  Node.not.where(node_index: nil).order(:node_index.asc).to_a
    end

    def run              
        updated_bulk = @nodes.map do |v|
            next unless v._neighbours.include? node_index
            { update_one: { filter: { node_index: v.node_index }, 
                            update: { '$set' => { _neighbours: v._neighbours - [node_index] }}}}
            
        end
        
        deleted_node = node.present? ? { delete_one: { filter: { node_index: node_index }}} : nil

        result = Mongo::BulkWrite.new(
            Node.collection,
            [updated_bulk, deleted_node].flatten.compact
        ).execute

        Rails.logger.info "updated #{result.modified_count}, removed #{result.deleted_count}"

        result.validate!
    end

    def node
        @node =  Node.find_by(node_index: node_index)
    end
end
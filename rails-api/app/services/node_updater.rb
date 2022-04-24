class NodeUpdater < BaseService
    attr_reader :node_index, :node, :node_params

    def initialize(node_index, node_params)
        @node_index = node_index
        @node_params = node_params
    end

    def run
        modified_params = node_params.to_h.except(:customized_fields, :node_index)
        node_params.customized_fields[0].each do |k, v|
            modified_params[k] = v 
        end
      
        node.update(modified_params)
        node
    end

    def node
        @node =  Node.find_by(node_index: node_index)
    end
end
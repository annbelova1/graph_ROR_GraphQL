class NodeUpdater
    attr_reader :node_params, :node

    def initialize(node_index, node_params)
        @node_index = node_index
        @node = Node.find_by(node_index: node_index)
        @node_params = node_params
    end

    def call
        raise ArgumentError unless node

        modified_params = node_params.to_h.except(:customized_fields, :node_index)
        node_params.customized_fields[0].each do |k, v|
            modified_params[k] = v 
        end
      
        node.update(modified_params)
        node
    end
end
class EdgeRemover
    attr_reader :first_node, :second_node

    def initialize(first_node_index, second_node_index)
        @first_node = Node.find_by(node_index: first_node_index)
        @second_node = Node.find_by(node_index: second_node_index)
    end

    def call
        return unless first_node || second_node

        first_node.drop_undirected_edge(second_node)

        first_node
    end
end
class EdgeRemover < BaseService
    attr_reader :first_node_index, :second_node_index

    def initialize(first_node_index, second_node_index)
        @first_node_index = first_node_index
        @second_node_index = second_node_index
    end

    def run
        first_node.drop_undirected_edge(second_node)

        first_node
    end

    def first_node
        @first_node = Node.find_by(node_index: first_node_index)
    end

    def second_node
        @second_node = Node.find_by(node_index: second_node_index)
    end
end
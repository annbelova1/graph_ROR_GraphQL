class EdgeCreator < BaseService
    attr_reader :first_node_index, :second_node_index, :undirected

    def initialize(first_node_index, second_node_index, undirected)
        @first_node_index = first_node_index
        @second_node_index = second_node_index
        @undirected = undirected
    end

    def run
        if undirected
            first_node.create_undirected_edge(second_node)
        else
            first_node.create_directed_edge(second_node)
        end

        second_node
    end

    def first_node
        @first_node = Node.find_by(node_index: first_node_index)
    end

    def second_node
        @second_node = Node.find_by(node_index: second_node_index)
    end
end
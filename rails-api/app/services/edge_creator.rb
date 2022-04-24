class EdgeCreator
    attr_reader :first_node, :second_node, :undirected

    def initialize(first_node_index, second_node_index, undirected)
        @first_node = Node.find_by(node_index: first_node_index)
        @second_node = Node.find_by(node_index: second_node_index)
        @undirected = undirected
    end

    def call
        raise ArgumentError.new("To create edge it's necessary two nodes") unless first_node && second_node

        if undirected
            first_node.create_undirected_edge(second_node)
        else
            first_node.create_directed_edge(second_node)
        end

        second_node
    rescue StandardError => e
        Rails.logger.error e.message
    end
end
module Mutations
    module Nodes
      class CreateEdge < BaseMutation
        description "Create Edge"
  
        argument :first_node_index, Integer, required: true
        argument :second_node_index, Integer, required: true
        argument :undirected, Boolean, required: false

        field :node, Types::NodeType, null: false

        def resolve(first_node_index:, second_node_index:, undirected: false)
            node = EdgeCreator.new(
                first_node_index,
                second_node_index,
                undirected
            ).call

            if node.errors.present?  
                raise GraphQL::ExecutionError.new(node.errors.full_messages.join(', '))
            else
                {node: node}
            end
        end
      end
    end
  end
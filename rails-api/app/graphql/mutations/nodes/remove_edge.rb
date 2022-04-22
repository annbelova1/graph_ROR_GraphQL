module Mutations
    module Nodes
      class RemoveEdge < BaseMutation
        description "Remove Edge"
  
        argument :first_node_index, Integer, required: true
        argument :second_node_index, Integer, required: true

        field :node, Types::NodeType, null: false

        def resolve(first_node_index:, second_node_index:)
            node = EdgeRemover.new(
                first_node_index,
                second_node_index,
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
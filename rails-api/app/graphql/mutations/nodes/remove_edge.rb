module Mutations
    module Nodes
      class RemoveEdge < BaseMutation
        description "Remove Edge"
  
        argument :first_node_index, Integer, required: true
        argument :second_node_index, Integer, required: true

        field :node, Types::NodeType, null: false

        def resolve(first_node_index:, second_node_index:)
            node = EdgeRemover.run(
                first_node_index,
                second_node_index,
            )

            if node.ok?  
                {
                    node: node.value
                }
            else
                raise GraphQL::ExecutionError.new(node.error)
            end
        end
      end
    end
  end
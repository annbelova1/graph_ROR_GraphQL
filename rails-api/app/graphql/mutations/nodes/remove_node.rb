module Mutations
    module Nodes
      class RemoveNode < BaseMutation
        description "Remove Node"
  
        argument :node_index, Integer, required: true

        field :result, Types::RemoveNodeResult, null: false

        def resolve(node_index:)
            result = NodeRemover.run(node_index)

            if result.ok?  
                {
                    result: result.value
                }
            else
                raise GraphQL::ExecutionError.new(result.error)
            end
        end
      end
    end
  end
module Mutations
    module Nodes
      class RemoveNode < BaseMutation
        description "Remove Node"
  
        argument :node_index, Integer, required: true

        field :result, Types::RemoveEdgeResult, null: false

        def resolve(node_index:)
            result = NodeRemover.new(node_index).call

            if result.present? 
                {result: result}
            else
                raise GraphQL::ExecutionError.new(result)
            end
        end
      end
    end
  end
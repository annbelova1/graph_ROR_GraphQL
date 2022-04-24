module Mutations
    module Nodes
      class UpdateNode < BaseMutation
        description "Updat Node"
  
        argument :node_index, Integer, required: true
        argument :node_params, Types::UpdateNodeInput, required: true
  
        field :node, Types::NodeType, null: false
  
        def resolve(node_index:, node_params:)
          node = NodeUpdater.run(node_index, node_params)
  
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
module Mutations
    module Nodes
      class UpdateNode < BaseMutation
        description "Updat Node"
  
        argument :node_index, Integer, required: true
        argument :node_params, Types::UpdateNodeInput, required: true
  
        field :node, Types::NodeType, null: false
  
        def resolve(node_index:, node_params:)
          node = NodeUpdater.new(node_index, node_params).call
  
          if node.errors.present?  
              raise GraphQL::ExecutionError.new(node.errors.full_messages.join(', '))
          else
              {node: node}
          end
        end
      end
    end
  end
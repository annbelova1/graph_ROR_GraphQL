module Mutations
  module Nodes
    class CreateNode < BaseMutation
      description "Create Node"

      argument :node, Types::CreateNodeInput, required: true

      field :node, Types::NodeType, null: false

      def resolve(node:)
        node = NodeCreator.new(node).call

        if node.errors.present?  
            raise GraphQL::ExecutionError.new(node.errors.full_messages.join(', '))
        else
            {node: node}
        end
      end
    end
  end
end
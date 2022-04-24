module Mutations
  module Nodes
    class CreateNode < BaseMutation
      description "Create Node"

      argument :node, Types::CreateNodeInput, required: true

      field :node, Types::NodeType, null: false

      def resolve(node:)
        node = NodeCreator.run(node)

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
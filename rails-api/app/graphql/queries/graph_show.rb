module Queries
    class ListShow < BaseQuery
    description "Get the customed list"

    # Inputs
    # argument :id, ID, required: false, description: "List Id"

    type [Types::NodeType], null: true

    def resolve(id: nil)
        Node.all
    rescue
        raise GraphQL::ExecutionError.new("List Not Found")
    end

    end
end
module Queries
    class GraphShow < BaseQuery
        description "Get the graph view"

        # Inputs
        # argument :id, ID, required: false, description: "List Id"

        # type [Types::NodeType], null: true

        def resolve
            Graph.new.record_to_file
        rescue
            raise GraphQL::ExecutionError.new("List Not Found")
        end
    end
end
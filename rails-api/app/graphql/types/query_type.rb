module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :nodes, String, null: false,
      description: "An example field added by the generator"

    field :show_list, resolver: Queries::ListShow
    field :download_graph, resolver: Queries::DownloadGraph

    # field :graph_show, resolver: Queries::GraphShow

    def nodes
      Node.pluck :name
    end
  end
end

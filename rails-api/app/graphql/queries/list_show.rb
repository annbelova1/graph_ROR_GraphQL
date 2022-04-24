module Queries
  class ListShow < BaseQuery
  description "Get list of nodes"

  # Inputs

  type [Types::NodeType], null: true

  def resolve
      Node.all
  rescue
      raise GraphQL::ExecutionError.new("List Not Found")
  end

  end
end
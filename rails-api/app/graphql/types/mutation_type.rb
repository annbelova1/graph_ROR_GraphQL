module Types
  class MutationType < Types::BaseObject
 
    field :create_node, mutation: Mutations::Nodes::CreateNode
    field :create_edge, mutation: Mutations::Nodes::CreateEdge
    field :remove_edge, mutation: Mutations::Nodes::RemoveEdge
    field :remove_node, mutation: Mutations::Nodes::RemoveNode
    field :update_node, mutation: Mutations::Nodes::UpdateNode
  end
end

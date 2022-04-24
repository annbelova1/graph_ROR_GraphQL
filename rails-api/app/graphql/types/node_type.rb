module Types
  class NodeType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB id string"
    field :node_index, Integer, null: false, description: "MongoDB id string"
    field :label, String, null: true, description: "Node's label"
    field :customized_fields, GraphQL::Types::JSON, null: true, description: "new fields"
    field :_neighbours, [String], null: true, description: "List edges"

    def customized_fields
      object.attributes.except('_id', 'node_index', 'label', '_neighbours', 'created_at', 'updated_at').to_h
    end
  end
end


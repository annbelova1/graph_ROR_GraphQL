module Types
    class CreateNodeInput < BaseInputObject
      argument :name, String, required: true, description: "Node Name"
      argument :node_index, Integer, required: true, description: "Node Index"
      argument :customized_fields, [GraphQL::Types::JSON], required: false, description: "new fields"
  end
end
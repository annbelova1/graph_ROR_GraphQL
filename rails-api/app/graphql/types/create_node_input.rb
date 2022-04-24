module Types
    class CreateNodeInput < BaseInputObject
      argument :label, String, required: true, description: "Node Label"
      argument :node_index, Integer, required: false, description: "Node Index"
      argument :customized_fields, [GraphQL::Types::JSON], required: false, description: "new fields"
  end
end
module Types
    class UpdateNodeInput < BaseInputObject
      argument :label, String, required: true, description: "Node Label"
      argument :customized_fields, [GraphQL::Types::JSON], required: false, description: "new fields"
  end
end
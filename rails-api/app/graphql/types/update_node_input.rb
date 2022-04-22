module Types
    class UpdateNodeInput < BaseInputObject
      argument :name, String, required: true, description: "Node Name"
      argument :customized_fields, [GraphQL::Types::JSON], required: false, description: "new fields"
  end
end
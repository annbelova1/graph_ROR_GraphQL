module Types
    class RemoveEdgeResult < Types::BaseObject
        field :deleted_count, Integer, null: true
        field :modified_count, Integer, null: true
  end
end
module Mutations
    module Nodes
      class CreateEdge < BaseMutation
        description "Create Edge"
  
        argument :first_node_index, String, required: true
        argument :second_node_index, String, required: true
        argument :undirected, Boolean, required: false

        field :node, Types::NodeType, null: false

        def resolve(first_node_index:, second_node_index:, undirected: false)
            node = EdgeCreator.run(
                first_node_index.to_i,
                second_node_index.to_i,
                undirected
            )

            if node.ok?  
                {
                    node: node.value 
                }
            else
                raise GraphQL::ExecutionError.new(node.error)
            end
        end
      end
    end
  end
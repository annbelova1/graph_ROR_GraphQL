class NodeCreator < BaseService
    attr_reader :node_params

    def initialize(node_params)
        @node_params = node_params
    end

    def run
        modified_params = node_params.to_h.except(:customized_fields)
        node_params.customized_fields[0].each do |k, v|
            modified_params[k] = v 
        end if node_params.customized_fields.present?
      
        Node.create(modified_params)
    end
end
class NodeCreator
    attr_reader :node_params

    def initialize(node)
        @node_params = node
    end

    def call
        modified_params = node_params.to_h.except(:customized_fields)
        node_params.customized_fields[0].each do |k, v|
            modified_params[k] = v 
        end if node_params.customized_fields.present?
      
        Node.create(modified_params)
    rescue StandardError => e
        Rails.logger.error e.message
    end
end
module Queries
    class DownloadGraph < BaseQuery
    description "Download Graph"

    type String, null: true

    def resolve
        file = Graph.new.record_to_file
        send_file(file)
        file
    rescue  StandardError => error
        raise GraphQL::ExecutionError.new(error)
    end

    end
end
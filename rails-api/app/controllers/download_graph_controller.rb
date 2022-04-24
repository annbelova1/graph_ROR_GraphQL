class DownloadGraphController < ActionController::API
    def download
        file = Graph.new.record_to_file
        send_file(file)
    end
end

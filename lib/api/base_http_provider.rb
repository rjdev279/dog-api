# frozen_string_literal: true

module Api
  class BaseHttpProvider
    def initialize(url)
      @url = url
      build_connection
    end

    private

    def build_connection
      @connection = Faraday.new(url: @url) do |faraday|
        faraday.options[:open_timeout] = 10
        faraday.options[:timeout] = 120
        faraday.ssl[:verify] = false
        faraday.adapter Faraday.default_adapter
      end
    rescue StandardError
      raise "Error" unless @connection
    end

    def api_get(path)
      @connection.get do |request|
        request.url path
      end
    end
  end
end

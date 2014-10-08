require 'json'
require 'hashie'

module HN
  module Request
    def get(path, options = {})
      request(:get, path, options)
    end

    private

    def request(method, path, options)
      response = connection.send(method) do |request|
        request.url(path, options)
      end
      prepare(response)
    end

    def prepare(response)
      result = JSON.parse(response.body) rescue response.body
      result.is_a?(Hash) ? Hashie::Mash.new(result) : result
    end
  end
end
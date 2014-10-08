require 'faraday_middleware'

module HN
  module Connection

    private

    def connection
      options = {
        headers: headers,
        ssl:     { verify: false },
        url:     api_url
      }

      Faraday.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end
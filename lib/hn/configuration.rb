require_relative 'version'

module HN
  module Configuration

    VALID_CONFIGURATION_KEYS = [:api_version, :base_url, :api_url, :headers]

    attr_accessor *VALID_CONFIGURATION_KEYS

    DEFAULT_VERSION  = 'v0'
    DEFAULT_BASE_URL = 'https://hacker-news.firebaseio.com'
    DEFAULT_API_URL  = "#{DEFAULT_BASE_URL}/#{DEFAULT_VERSION}/"
    DEFAULT_HEADERS  = { accept:     'application/json',
                         user_agent: "hn_api gem #{HN::Version}" }

    def configure
      yield self
    end

    def reset
      self.api_version = DEFAULT_VERSION
      self.base_url    = DEFAULT_BASE_URL
      self.api_url     = DEFAULT_API_URL
      self.headers     = DEFAULT_HEADERS
      self
    end
  end
end
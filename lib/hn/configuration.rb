module HN
  module Configuration

    VALID_CONFIGURATION_KEYS = [:api_version, :base_url]

    attr_accessor *VALID_CONFIGURATION_KEYS

    DEFAULT_VERSION  = 'v0'
    DEFAULT_BASE_URL = "https://hacker-news.firebaseio.com/#{DEFAULT_VERSION}/"

    def configure
      yield self
    end

    def reset
      self.api_version = DEFAULT_VERSION
      self.base_url    = DEFAULT_BASE_URL
      self
    end
  end
end
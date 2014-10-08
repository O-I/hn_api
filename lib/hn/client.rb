require_relative 'request'
require_relative 'connection'
require_relative 'configuration'

module HN
  class Client
    include HN::Request
    include HN::Connection
    include HN::Configuration

    def initialize
      reset
    end

    def item(id, options = {})
      get("item/#{id}.json", options)
    end

    def user(id, options = {})
      get("user/#{id}.json", options)
    end

    def top_stories(options = {})
      get('topstories.json', options)
    end

    def max_item(options = {})
      get('maxitem.json', options)
    end

    def updates(options = {})
      get('updates.json', options)
    end
  end
end
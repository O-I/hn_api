require_relative 'configuration'

module HN
  class Client
    include Guardian::Configuration

    def initialize
      reset
    end
  end
end
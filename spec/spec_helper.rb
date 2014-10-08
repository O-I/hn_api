require 'simplecov'
require 'coveralls'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'webmock/rspec'
require 'hn_api'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end

WebMock.disable_net_connect!(allow: 'coveralls.io')

def hn_test_client
  HN::Client.new
end

def stub_get(path, options = {})
  file = options.delete(:returns)
  endpoint = HN::Configuration::DEFAULT_API_URL + path
  headers  = HN::Configuration::DEFAULT_HEADERS
  stub_request(:get, endpoint)
    .with(headers: headers)
    .to_return(body: fixture(file))
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
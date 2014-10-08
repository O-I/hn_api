# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'
require 'jeweler'
require './lib/hn/version'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = 'hn_api'
  gem.version = HN::Version
  gem.homepage = 'http://github.com/O-I/hn_api'
  gem.license = 'MIT'
  gem.summary = %Q{Ruby wrapper for the Hacker News API}
  gem.description = %Q{Ruby client for the Hacker News API}
  gem.email = 'hore.rahul@gmail.com'
  gem.authors = ["Rahul Horé"]
  gem.required_ruby_version = '>= 1.9.3'
  gem.files = FileList['lib/**/*.rb']
  gem.test_files = []
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
  version = HN::Version

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "hn_api #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
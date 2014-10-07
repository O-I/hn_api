# hn_api
[![Build Status](https://travis-ci.org/O-I/guardian_api.svg?branch=master)](https://travis-ci.org/O-I/guardian_api)
[![Coverage Status](https://img.shields.io/coveralls/O-I/hn_api.svg)](https://coveralls.io/r/O-I/hn_api?branch=master)

A Ruby wrapper for [the Hacker News API](https://github.com/HackerNews/API). Under development.

# Installation

`gem install hn_api` or add `gem 'hn_api'` to your `Gemfile` and `bundle`.

# Configuration

Currently, the Hacker News API is read-only and does not require an API key. The API is based at https://hacker-news.firebaseio.com, and is currently on version `v0`.

```ruby
# For now, this one line is all you need to configure
@client = HN::Client.new

# In the event of a version change, you can set the `api_url` like so
@client.configure do |config|
  config.api_url = 'https://hacker-news.firebaseio.com/v1/'
end
```

# Contributing to hn_api
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2014 Rahul Horé. See LICENSE.txt for
further details.
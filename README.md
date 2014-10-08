# hn_api
[![Build Status](https://travis-ci.org/O-I/guardian_api.svg?branch=master)](https://travis-ci.org/O-I/guardian_api)
[![Coverage Status](https://img.shields.io/coveralls/O-I/hn_api.svg)](https://coveralls.io/r/O-I/hn_api?branch=master)

A Ruby wrapper for the [Hacker News API](https://github.com/HackerNews/API).

## Installation

`gem install hn_api` or add `gem 'hn_api'` to your `Gemfile` and `bundle`.

## Configuration

Currently, the Hacker News API is read-only and does not require an API key. The API is based at https://hacker-news.firebaseio.com, and is currently on version `v0`.

```ruby
# For now, this one line is all you need to configure
@client = HN::Client.new

# In the event of a version change, you can set the `api_url` like so
@client.configure do |config|
  config.api_url = 'https://hacker-news.firebaseio.com/v1/'
end

# And you can always reset to the defaults
@client.reset
```

## Usage

Descriptions and examples of the supported actions are below. For a more detailed explanation of available endpoints and an exhaustive list of the properties each response returns, check out the official [Hacker News API documentation](https://github.com/HackerNews/API).

### Items [GET /v0/item/#{id}.json](https://github.com/HackerNews/API#items)

Fetches an item (story, comment, poll, etc.) by id. Returns a `Hashie::Mash`.

```ruby
story = @client.item(8422599)
story.title # Hacker News API
story.url   # http://blog.ycombinator.com/hacker-news-api

comment_ids = story.kids
first_comment = @client.item(comment_ids.first)
first_comment.text # Oh man you guys, patio11 has generated...
```

### Users [GET /v0/user/#{id}.json](https://github.com/HackerNews/API#users)

Fetches a user by unique case-sensitive username. Returns a `Hashie::Mash`.

```ruby
me = @client.user('co_pl_te')
me.karma                  # 4186
me.about.split(?\n).first # Everything to everyone.
me.submitted              # an array of my submitted items' ids (stories, comments, etc.)
```

### Live Data

The following endpoints are updated in real-time and will allow you to observe changes in front page ranking, new items, and new profiles.

#### Top Stories [GET /v0/topstories.json](https://github.com/HackerNews/API#top-stories)

Fetches the current top 100 story ids. Returns an `Array`.

```ruby
@client.top_stories
```

#### Max Item ID [GET /v0/maxitem.json](https://github.com/HackerNews/API#max-item-id)

Fetches the current largest item id. Returns a `String`.

```ruby
@client.max_item
```

#### Changed Items and Profiles [GET /v0/updates.json](https://github.com/HackerNews/API#changed-items-and-profiles)

Fetches item and profile changes. Returns a `Hashie::Mash`.

```ruby
updates = @client.updates
updates.items    # an array of updated item ids
updates.profiles # an array of updated profile ids
```

## Contributing to hn_api
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Rahul Horé. See LICENSE.txt for
further details.
require 'spec_helper'

describe HN::Client do
  let(:client) { hn_test_client }

  describe '#item' do

    context 'story' do
      let(:id) { 8422599 }
      before { stub_get "item/#{id}.json", returns: 'items/story.json' }

      it 'returns a story by id' do
        expect(client.item(id).title).to eq 'Hacker News API'
        expect(client.item(id).type).to eq  'story'
      end

      it 'returns a Hashie::Mash' do
        expect(client.item(id)).to be_a Hashie::Mash
      end
    end

    context 'comment' do
      let(:id) { 2921983 }
      before { stub_get "item/#{id}.json", returns: 'items/comment.json' }

      it 'returns a comment by id' do
        expect(client.item(id).by).to eq   'norvig'
        expect(client.item(id).type).to eq 'comment'
      end

      it 'returns a Hashie::Mash' do
        expect(client.item(id)).to be_a Hashie::Mash
      end
    end

    context 'poll' do
      let(:id) { 126809 }
      before { stub_get "item/#{id}.json", returns: 'items/poll.json' }

      it 'returns a poll by id' do
        expect(client.item(id).by).to eq   'pg'
        expect(client.item(id).type).to eq 'poll'
      end

      it 'returns a Hashie::Mash' do
        expect(client.item(id)).to be_a Hashie::Mash
      end
    end

    context 'poll part' do
      let(:id) { 160705 }
      before { stub_get "item/#{id}.json", returns: 'items/poll_part.json' }

      it 'returns a poll part by id' do
        expect(client.item(id).by).to eq   'pg'
        expect(client.item(id).type).to eq 'pollopt'
      end

      it 'returns a Hashie::Mash' do
        expect(client.item(id)).to be_a Hashie::Mash
      end
    end
  end

  describe '#user' do
    let(:id) { 'co_pl_te' }
    before { stub_get "user/#{id}.json", returns: 'user.json' }

    it 'returns a user by unique case-sensitive username' do
      expect(client.user(id).karma).to eq    4186
      expect(client.user(id).about).to match /theallbox/
    end

    it 'returns a Hashie::Mash' do
      expect(client.user(id)).to be_a Hashie::Mash
    end
  end

  describe '#top_stories' do
    before { stub_get 'topstories.json', returns: 'top_stories.json' }

    it 'returns an Array of the current top 100 stories' do
      expect(client.top_stories).to be_an Array
      expect(client.top_stories.size).to be 100
    end
  end
end
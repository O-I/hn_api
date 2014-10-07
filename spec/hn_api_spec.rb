require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe HN do
  describe '.new' do
    it 'returns an HN::Client' do
      expect(HN.new).to be_an HN::Client
    end
  end

  describe '.configure' do
    it 'sets the api version' do
      expect(HN.api_url).to eq 'https://hacker-news.firebaseio.com/v0/'
      HN.configure do |config|
        config.api_url = 'https://hacker-news.firebaseio.com/v1/'
      end
      expect(HN.api_url).to eq 'https://hacker-news.firebaseio.com/v1/'
    end
  end
end

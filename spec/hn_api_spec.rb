require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe HN do
  describe '.new' do
    it 'returns an HN::Client' do
      expect(HN.new).to be_an HN::Client
    end
  end
end

require 'rails_helper'

RSpec.describe 'POST https://safe-for-work-api.herokuapp.com/api/analyses', type: :request do
  before do
    stub_request(:post, 'https://safe-for-work-api.herokuapp.com/api/analyses')
      .with(body: { 'category' => 'text' },
            headers: {
              'Accept' => '*/*',
              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Host' => 'safe-for-work-api.herokuapp.com',
              'User-Agent' => 'Ruby'
            })
      .to_return(status: 200, body: '', headers: {})
  end

  subject { response }

  describe 'when safe for work text is called on the API' do
    before do
      url = URI('https://safe-for-work-api.herokuapp.com/api/analyses')
      params = URI.encode_www_form({ "category": 'text' })
      #url.query = URI.encode_www_form(params)
      #binding.pry
      Net::HTTP.post(url, params)
    end

    it 'is expected to return a clean response' do
      expect(eval(response_json['results']['classification'])[0]['tag_name']).to eq 'clean'
    end
  end
end

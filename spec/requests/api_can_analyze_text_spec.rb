require 'rails_helper'

RSpec.describe 'POST api/analyses', type: :request do
  let(:outcome) do
    file_fixture('happy_test_response.json').read
  end

  params = { 
    resource: 'How is the weather today?',
    category: 'text'
  } 

  # subject { response }
  describe 'when safe for work text is called on the API' do
    before do
      stub_request(:post, 'https://safe-for-work-api.herokuapp.com/api/analyses')
        .with(body: { 'category' => 'text' },
              headers: {
                'Accept' => '*/*',
                'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'Host' => 'safe-for-work-api.herokuapp.com',
                'User-Agent' => 'Ruby'
              })
        .to_return(status: 200, body: outcome)
      post '/api/analyses', params: params

      # before do
      #   url = URI('https://safe-for-work-api.herokuapp.com/api/analyses')
      #   params = URI.encode_www_form({ "category": 'text' })
      #   # url.query = URI.encode_www_form(params)
      #   response = Net::HTTP.post(url, params)
      #   # binding.pry
    end

    it 'is expected to respond with a 200 message' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a clean response' do
      response = JSON.parse(response.body)
      binding.pry
      expect(eval(response['results']['classifications'])[0]['tag_name']).to eq 'clean'
    end
  end
end

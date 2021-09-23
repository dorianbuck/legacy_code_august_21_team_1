RSpec.describe 'POST api/analyses', type: :request do
  let(:outcome) do
    JSON.parse(file_fixture('happy_test_image_response.json').read)
  end
  let(:params) do
    { analysis: { resource: '"http://atwoodmagazine.com/wp-content/uploads/2018/02/Blue-Jazz-TV-2018-1.jpg"',
                  category: 'image' } }
  end

  describe 'when safe for work image is called on the api' do
    before do
      stub_request(:post, 'https://api.clarifai.com/v2/models/d16f390eb32cad478c7ae150069bd2c6/outputs')
        .with(
          body: '{"inputs":[{"data":{"image":{"url":"\\"http://atwoodmagazine.com/wp-content/uploads/2018/02/Blue-Jazz-TV-2018-1.jpg\\""}}}]}',
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Authorization' => 'Key 9561310a9cd84b16a1625f2acd2e0086',
            'Content-Length' => '122',
            'Host' => 'api.clarifai.com',
            'User-Agent' => 'rest-client/2.1.0.rc1 (darwin18.7.0 x86_64) ruby/2.5.1p57'
          }
        )
        .to_return(status: 200, body: outcome, headers: {})

      post '/api/analyses', params: params
    end
    it 'is expected to respond with a 200 message' do
      expect(response).to have_http_status 200
    end
  end
end

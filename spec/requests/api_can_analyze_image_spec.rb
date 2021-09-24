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
          body: '{"inputs":[{"data":{"image":{"url":"\\"http://atwoodmagazine.com/wp-content/uploads/2018/02/Blue-Jazz-TV-2018-1.jpg\\""}}}]}'

        )
        .to_return(status: 200, body: outcome, headers: {})

      post '/api/analyses', params: params
    end
    it 'is expected to respond with a 200 message' do
      expect(response).to have_http_status 200
    end

    it 'it is expected to respond with a safe score' do
      expect(JSON.parse(response.body)['results']['safe'].to_f).to eq 0.999055
    end
  end
end

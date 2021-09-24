RSpec.describe 'POST api/analyses', type: :request do
  let(:outcome) do
    JSON.parse(file_fixture('happy_test_text_response.json').read)
  end
  let(:params) do
    { analysis: { resource: 'How is the weather today?',
                  category: 'text' } }
  end

  describe 'when safe for work text is called on the API' do
    before do
      stub_request(:post, 'https://api.monkeylearn.com/v3/classifiers/cl_KFXhoTdt/classify/')
        .with(
          body: '{"data":["How is the weather today?"]}'
        )
        .to_return(status: 200, body: outcome, headers: {})

      post '/api/analyses', params: params
    end

    it 'is expected to respond with a 200 message' do
      expect(@response).to have_http_status 200
    end

    it 'is expected to return a clean response' do
      response = response_json
      expect(eval(response['results']['classifications'])[0]['tag_name']).to eq 'clean'
    end
  end
end

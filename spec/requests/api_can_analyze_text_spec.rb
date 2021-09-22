RSpec.describe 'POST api/analyses' do

  before  do
    stub_request(:any, 'https://safe-for-work-api.herokuapp.com')
  end

  subject { response }

  describe 'when safe for work text is called on the API' do
    before do
      post '/api/analyses'
    end

    it 'is expected to return a clean response' do
      expect(eval(response_json['results']['classification'])[0]['tag_name']).to eq 'clean'
    end
  end
  
end


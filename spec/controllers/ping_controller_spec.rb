require 'rails_helper'

RSpec.describe PingController, type: :controller do
  let(:authorised) { create(:user) }
  before do
    sign_in authorised
  end
  it 'renders deployment information as JSON' do
    expect(Deployment).to receive(:info).and_return(foo: 'bar')
    get :index
    expect(JSON.parse(response.body)).to eq('foo' => 'bar')
  end

  describe 'GET #ping' do
    before(:each) { get :index }

    it 'returns success code' do
      expect(response).to have_http_status(:success)
    end

    it 'returns JSON' do
      expect(response.content_type).to eq('application/json')
    end

    describe 'renders correct json' do
      let(:json) { JSON.parse(response.body) }
      let(:keys) do
        ["build_date",
         "commit_id",
         "build_tag"]
      end

      it 'has ping.json schema defined keys' do
        expect(json.keys).to eq keys
      end

      it 'key count' do
        expect(json.count).to eq 3
      end
    end
  end

end
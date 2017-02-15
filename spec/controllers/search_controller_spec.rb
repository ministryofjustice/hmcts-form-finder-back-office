require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe 'INDEX' do
    it 'should return  200 if successful' do
      get :index
      expect(response.status).to eq(200)
    end

  end

end


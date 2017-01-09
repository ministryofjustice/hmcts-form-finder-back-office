# require 'rails_helper'
#
# RSpec.describe PingController, type: :controller do
#   let(:authorised) { create(:user) }
#
#   describe "anonymous user" do
#     # before :each do
#     #   # This simulates an anonymous user
#     #   login_with nil
#     # end
#     before do
#       sign_in authorised
#     end
#     it "should be get Json" do
#       get :index
#       expect response.body).should_not be_nil
#     end
#
#   end
#
# end


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
end
require 'rails_helper'

RSpec.describe 'redirect_urls/index', type: :view do
  before(:each) do
    assign(:active_redirect_urls, [
             RedirectUrl.create!(
               incoming: 'Old Place',
               outgoing: 'New Place'
             ),
             RedirectUrl.create!(
               incoming: 'Old Place',
               outgoing: 'New Place'
             )
           ])
    assign(:inactive_redirect_urls,
           [
             RedirectUrl.create!(
               incoming: 'Old Place',
               outgoing: 'New Place'
             ),
             RedirectUrl.create!(
               incoming: 'Old Place',
               outgoing: 'New Place'
             )
           ])
  end
  it 'renders a list of redirect_urls' do
    render
    assert_select 'tr>td', text: 'Old Place'.to_s, count: 4
    assert_select 'tr>td', text: 'New Place'.to_s, count: 4
  end
end

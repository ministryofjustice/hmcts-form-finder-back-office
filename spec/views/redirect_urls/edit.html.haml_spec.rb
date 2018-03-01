require 'rails_helper'

RSpec.describe 'redirect_urls/edit', type: :view do
  before(:each) do
    @redirect_url = assign(:redirect_url,
                       RedirectUrl.create!(
                         incoming: 'MyString',
                         outgoing: 'MyString'
                       )
                      )
  end

  it 'renders the edit redirect_url form' do
    render

    assert_select 'form[action=?][method=?]', redirect_url_path(@redirect_url), 'post' do
      assert_select 'input#redirect_url_incoming[name=?]', 'redirect_url[incoming]'
      assert_select 'input#redirect_url_outgoing[name=?]', 'redirect_url[outgoing]'
    end
  end
end

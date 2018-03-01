require 'rails_helper'

RSpec.describe 'redirect_urls/new', type: :view do
  before(:each) do
    assign(:redirect_url,
           RedirectUrl.new(
             incoming: 'MyString',
             outgoing: 'MyString'
           )
          )
  end

  it 'renders new redirect_url form' do
    render

    assert_select 'form[action=?][method=?]', redirect_urls_path, 'post' do
      assert_select 'input#redirect_url_incoming[name=?]', 'redirect_url[incoming]'
      assert_select 'input#redirect_url_outgoing[name=?]', 'redirect_url[outgoing]'
    end
  end
end

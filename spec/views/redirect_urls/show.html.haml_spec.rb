require 'rails_helper'

RSpec.describe 'redirect_urls/show', type: :view do
  before(:each) do
    @redirect_url = assign(:redirect_url,
                           RedirectUrl.create!(
                             incoming: 'Old place',
                             outgoing: 'New place'
                           )
                          )
  end
  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Old place/)
    expect(rendered).to match(/New place/)
  end
end

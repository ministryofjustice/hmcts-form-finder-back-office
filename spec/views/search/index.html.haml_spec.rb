require 'rails_helper'

RSpec.describe "search/index", type: :view do
  it 'should return English title for Welsh Locale' do
    render
    expect(rendered).to include("finder")
  end
  it 'should return Welsh title for Welsh Locale' do
    I18n.locale = 'cy'
    render
    expect(rendered).to include('ffurflenni')
  end
end



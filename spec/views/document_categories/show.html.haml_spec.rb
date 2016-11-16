require 'rails_helper'

RSpec.describe "document_categories/show", type: :view do
  before(:each) do
    @document_category = assign(:document_category, DocumentCategory.create!(
      :document => nil,
      :category => nil,
      :sort_order => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end

require 'rails_helper'

RSpec.describe "document_categories/show", type: :view do
  let(:valid_attributes) {
    attributes_for(:document_category)
  }

  before(:each) do
    document_category = DocumentCategory.create! valid_attributes
    @document_category = assign(:document_category, document_category)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end

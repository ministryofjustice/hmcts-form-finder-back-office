require 'rails_helper'

RSpec.describe 'documentcategories/show', type: :view do
  let(:document) { create(:document) }
  let(:category) { create(:category) }
  let(:valid_attributes) { { document: document, category: category } }

  before(:each) do
    document_category = DocumentCategory.create! valid_attributes
    @document_category = assign(:document_category, document_category)
  end

  it 'renders attributes in <p>' do
    render
    # expect(rendered).to match(//)
    # expect(rendered).to match(//)
    # expect(rendered).to match(/2/)
  end
end

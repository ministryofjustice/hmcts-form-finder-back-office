require 'rails_helper'

RSpec.describe 'documentcategories/index', type: :view do
  let(:document) { create(:document) }
  let(:category) { create(:category) }
  let(:valid_attributes) { { document: document, category: category } }

  before(:each) do
    document_category = DocumentCategory.create! valid_attributes
    document_category2 = DocumentCategory.create! valid_attributes
    assign(:documentcategories, [document_category, document_category2])
  end
end

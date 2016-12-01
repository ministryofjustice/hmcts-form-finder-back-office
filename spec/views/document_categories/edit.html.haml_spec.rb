require 'rails_helper'

RSpec.describe "document_categories/edit", type: :view do
  let(:document) { create(:document)}
  let(:category) { create(:category)}
  let(:valid_attributes) {
    {:document => document, :category => category}
  }

  before(:each) do
    document_category = DocumentCategory.create! valid_attributes
    @document_category = assign(:document_category, document_category )
  end

  it "renders the edit document_category form" do
    render

    # assert_select "form[action=?][method=?]", document_category_path(@document_category), "post" do
    #
    #   assert_select "input#document_category_document_id[name=?]", "document_category[document_id]"
    #
    #   assert_select "input#document_category_category_id[name=?]", "document_category[category_id]"
    #
    #   assert_select "input#document_category_sort_order[name=?]", "document_category[sort_order]"
    # end
  end
end

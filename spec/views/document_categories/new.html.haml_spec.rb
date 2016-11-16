require 'rails_helper'

RSpec.describe "document_categories/new", type: :view do
  before(:each) do
    assign(:document_category, DocumentCategory.new(
      :document => nil,
      :category => nil,
      :sort_order => 1
    ))
  end

  it "renders new document_category form" do
    render

    assert_select "form[action=?][method=?]", document_categories_path, "post" do

      assert_select "input#document_category_document_id[name=?]", "document_category[document_id]"

      assert_select "input#document_category_category_id[name=?]", "document_category[category_id]"

      assert_select "input#document_category_sort_order[name=?]", "document_category[sort_order]"
    end
  end
end

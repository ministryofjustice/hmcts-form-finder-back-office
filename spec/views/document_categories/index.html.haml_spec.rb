require 'rails_helper'

RSpec.describe "document_categories/index", type: :view do
  let(:document) { create(:document)}
  let(:category) { create(:category)}
  let(:valid_attributes) {
    {:document => document, :category => category}
  }

  before(:each) do
    document_category = DocumentCategory.create! valid_attributes
    document_category2 = DocumentCategory.create! valid_attributes
    assign(:document_categories, [document_category,
           document_category2
    ])
  end

  it "renders a list of document_categories" do
    render
    #assert_select "tr>td", :text => nil.to_s, :count => 2
    #assert_select "tr>td", :text => nil.to_s, :count => 2
    #assert_select "td", :text => 2.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "document_categories/index", type: :view do
  before(:each) do
    assign(:document_categories, [
      DocumentCategory.create!(
        :document => nil,
        :category => nil,
        :sort_order => 2
      ),
      DocumentCategory.create!(
        :document => nil,
        :category => nil,
        :sort_order => 2
      )
    ])
  end

  it "renders a list of document_categories" do
    render
    #assert_select "tr>td", :text => nil.to_s, :count => 2
    #assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

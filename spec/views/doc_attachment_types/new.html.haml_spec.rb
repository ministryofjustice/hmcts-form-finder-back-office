require 'rails_helper'

RSpec.describe "doc_attachment_types/new", type: :view do
  before(:each) do
    assign(:doc_attachment_type, DocAttachmentType.new(
      :english_name => "MyString",
      :welsh_name => "MyString"
    ))
  end

  it "renders new doc_attachment_type form" do
    render

    assert_select "form[action=?][method=?]", doc_attachment_types_path, "post" do

      assert_select "input#doc_attachment_type_english_name[name=?]", "doc_attachment_type[english_name]"

      assert_select "input#doc_attachment_type_welsh_name[name=?]", "doc_attachment_type[welsh_name]"
    end
  end
end

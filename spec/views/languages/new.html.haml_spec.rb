require 'rails_helper'

RSpec.describe "languages/new", type: :view do
  before(:each) do
    assign(:language, Language.new(
      :english_name => "MyString",
      :welsh_name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders new language form" do
    render

    assert_select "form[action=?][method=?]", languages_path, "post" do

      assert_select "input#language_english_name[name=?]", "language[english_name]"

      assert_select "input#language_welsh_name[name=?]", "language[welsh_name]"

      assert_select "input#language_code[name=?]", "language[code]"
    end
  end
end

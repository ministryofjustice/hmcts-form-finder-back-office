require 'rails_helper'

RSpec.describe "languages/index", type: :view do
  before(:each) do
    assign(:languages, [
      Language.create!(
        :english_name => "English Name",
        :welsh_name => "Welsh Name",
        :code => "Code"
      ),
      Language.create!(
        :english_name => "English Name",
        :welsh_name => "Welsh Name",
        :code => "Code"
      )
    ])
  end

  it "renders a list of languages" do
    render
    assert_select "tr>td", :text => "English Name".to_s, :count => 2
    assert_select "tr>td", :text => "Welsh Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
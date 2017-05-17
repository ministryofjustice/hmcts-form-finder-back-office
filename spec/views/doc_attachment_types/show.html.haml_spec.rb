require 'rails_helper'

RSpec.describe "doc_attachment_types/show", type: :view do
  before(:each) do
    @doc_attachment_type = assign(:doc_attachment_type,
                                  DocAttachmentType.create!(
                                    english_name: "English Name",
                                    welsh_name: "Welsh Name"
                                  )
                                 )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/English Name/)
    expect(rendered).to match(/Welsh Name/)
  end
end

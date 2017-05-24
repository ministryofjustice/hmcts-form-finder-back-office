require 'rails_helper'

RSpec.describe 'languages/show', type: :view do
  before(:each) do
    @language = assign(:language,
                       Language.create!(
                         english_name: 'English Name',
                         welsh_name: 'Welsh Name',
                         code: 'Code'
                       )
                      )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/English Name/)
    expect(rendered).to match(/Welsh Name/)
    expect(rendered).to match(/Code/)
  end
end

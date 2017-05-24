require 'rails_helper'

RSpec.describe 'categories/show', type: :view do
  before(:each) do
    @category = assign(:category,
                       Category.create!(
                         english_name: 'English Name',
                         welsh_name: 'Welsh Name'
                       )
                      )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/English Name/)
    expect(rendered).to match(/Welsh Name/)
  end
end

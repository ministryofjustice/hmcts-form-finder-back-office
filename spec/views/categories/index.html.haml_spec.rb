require 'rails_helper'
RSpec.describe 'categories/index', type: :view do
  before(:each) do
    assign(:categories, [
             Category.create!(
               english_name: 'English Name',
               welsh_name: 'Welsh Name'
             ),
             Category.create!(
               english_name: 'English Name',
               welsh_name: 'Welsh Name'
             )
           ])
  end

  it 'renders a list of categories' do
    render
    assert_select 'tr>td', text: 'English Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Welsh Name'.to_s, count: 2
  end
end

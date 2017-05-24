require 'rails_helper'

RSpec.describe 'categories/edit', type: :view do
  before(:each) do
    @category = assign(:category,
                       Category.create!(
                         english_name: 'MyString',
                         welsh_name: 'MyString'
                       )
                      )
  end

  it 'renders the edit category form' do
    render

    assert_select 'form[action=?][method=?]', category_path(@category), 'post' do
      assert_select 'input#category_english_name[name=?]', 'category[english_name]'
      assert_select 'input#category_welsh_name[name=?]', 'category[welsh_name]'
    end
  end
end

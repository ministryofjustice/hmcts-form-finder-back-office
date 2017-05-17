require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  before(:each) do
    assign(:category,
           Category.new(
             :english_name => 'MyString',
             :welsh_name => 'MyString'
           )
          )
  end

  it 'renders new category form' do
    render

    assert_select 'form[action=?][method=?]', categories_path, 'post' do
      assert_select 'input#category_english_name[name=?]', 'category[english_name]'
      assert_select 'input#category_welsh_name[name=?]', 'category[welsh_name]'
    end
  end
end

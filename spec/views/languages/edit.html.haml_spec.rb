require 'rails_helper'

RSpec.describe 'languages/edit', type: :view do
  before(:each) do
    @language = assign(:language,
                       Language.create!(
                         :english_name => 'MyString',
                         :welsh_name => 'MyString',
                         :code => 'MyString'
                       )
                      )
  end

  it 'renders the edit language form' do
    render

    assert_select 'form[action=?][method=?]', language_path(@language), 'post' do
      assert_select 'input#language_english_name[name=?]', 'language[english_name]'
      assert_select 'input#language_welsh_name[name=?]', 'language[welsh_name]'
      assert_select 'input#language_code[name=?]', 'language[code]'
    end
  end
end

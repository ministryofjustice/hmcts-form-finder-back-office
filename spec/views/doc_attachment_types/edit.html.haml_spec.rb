require 'rails_helper'

RSpec.describe 'doc_attachment_types/edit', type: :view do
  before(:each) do
    @doc_attachment_type = assign(:doc_attachment_type,
                                  DocAttachmentType.create!(
                                    :english_name => 'MyString',
                                    :welsh_name => 'MyString'
                                  )
                                 )
  end

  it 'renders the edit doc_attachment_type form' do
    render

    assert_select 'form[action=?][method=?]', doc_attachment_type_path(@doc_attachment_type), 'post' do
      assert_select 'input#doc_attachment_type_english_name[name=?]', 'doc_attachment_type[english_name]'
      assert_select 'input#doc_attachment_type_welsh_name[name=?]', 'doc_attachment_type[welsh_name]'
    end
  end
end

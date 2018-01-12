require 'rails_helper'

feature 'Link one document' do
  let(:language_attributes) { { english_name: 'English', welsh_name: 'Saesneg', code: 'eng' } }
  let(:type_attributes) { { english_name: 'Form', welsh_name: 'Ffurflen' } }

  background do
    @language = Language.create! language_attributes
    @type = DocAttachmentType.create! type_attributes
    @user = create(:user)

    login_page.load
    login_page.log_in(@user.email, @user.password)
    documents_index_page.add_document_button.click
    new_document_page.form.create_active_document('N213(CHFL)', 'Acknowledgment of Service - Chancery Division Financial List', @type.english_name, @language.english_name)
  end

  scenario 'to another' do
    click_on('Documents')
    click_on('Add document')
    new_document_page.form.create_active_document('T200', 'Notice of Appeal (Form EO9)', @type.english_name, @language.english_name)
    click_on('Continue')
    expect(link_documents_page.linked_list).to have_text 'No documents'
    select('N213(CHFL) (English DOCX)')
    click_on('Link')
    expect(link_documents_page.linked_list).to have_text 'N213(CHFL) English DOCX'
  end

  scenario 'to another then remove it' do
    click_on('Documents')
    click_on('Add document')
    new_document_page.form.create_active_document('T200', 'Notice of Appeal (Form EO9)', @type.english_name, @language.english_name)
    click_on('Continue')
    expect(link_documents_page.linked_list).to have_text 'No documents'
    select('N213(CHFL) (English DOCX)')
    click_on('Link')
    expect(link_documents_page.linked_list).to have_text 'N213(CHFL) English DOCX'
    click_on('Remove this')
    expect(link_documents_page.linked_list).to have_text 'No documents'
  end
end

require 'rails_helper'

feature 'On the landing page' do
  let(:language_attributes) { { english_name: 'English', welsh_name: 'Saesneg', code: 'eng' } }
  let(:type_attributes) { { english_name: 'Form', welsh_name: 'Ffurflen' } }

  background do
    @language = Language.create! language_attributes
    @type = DocAttachmentType.create! type_attributes
    @user = create(:user)
    login_page.load
    login_page.log_in(@user.email, @user.password)
  end

  scenario 'choose to add a document' do
    documents_index_page.add_document_button.click
    expect(new_document_page.main_heading).to be_present
  end

  scenario 'choose to edit a document' do
    documents_index_page.add_document_button.click
    new_document_page.form.create_active_document('N213(CHFL)', 'Acknowledgment of Service - Chancery Division Financial List', @type.english_name, @language.english_name)
    assign_categories_page.navigation.documents.click
    select('N213(CHFL) (English DOCX)')
    click_on('Edit')
    expect(edit_document_page.main_heading).to be_present
    expect(edit_document_page).to have_text 'n213(chfl)-eng.docx'
  end
end

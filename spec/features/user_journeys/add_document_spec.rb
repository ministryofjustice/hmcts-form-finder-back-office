require 'rails_helper'

feature 'Adding a document by ' do
  let(:language_attributes) { { english_name: 'English', welsh_name: 'Saesneg', code: 'eng' } }
  let(:type_attributes) { { english_name: 'Form', welsh_name: 'Ffurflen' } }

  background do
    @language = Language.create! language_attributes
    @type = DocAttachmentType.create! type_attributes
    @user = create(:user)

    login_page.load
    login_page.log_in(@user.email, @user.password)
    documents_index_page.add_document_button.click
  end

  scenario 'Submitting a blank form' do
    new_document_page.form.continue.click
    expect(new_document_page.error_heading).to have_text '6 errors prevented this document from being submitted:'
    expect_missing_file_error
    expect_missing_type_error
    expect_missing_reference_error
    expect_missing_title_error
    expect_missing_version_date_error
    expect_missing_publication_date_error
  end

  scenario 'Submitting a document with required field data only' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
  end

  scenario 'Submitting a document without a file attachment or summary' do
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
    expect_1_error_heading
    expect_missing_file_error
  end

  scenario 'Submitting a document without a reference or summary' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_title
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
    expect_1_error_heading
    expect_missing_reference_error
  end

  scenario 'Submitting a document without a title or summary' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
    expect_1_error_heading
    expect_missing_title_error
  end

  scenario 'Submitting a document without a type, summary or publishing date' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
    expect_1_error_heading
    expect_missing_type_error
  end

  scenario 'Submitting a document without a language, summary or publishing date' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    choose(@type.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
  end

  scenario 'Submitting a document without a version date or summary' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
    expect_1_error_heading
    expect_missing_version_date_error
  end

  scenario 'Submitting a document without a summary or publishing date' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.continue.click
    expect_1_error_heading
    expect_missing_publication_date_error
  end

  scenario 'Submitting an inactive document with required fields' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.make_inactive
    new_document_page.form.continue.click
  end

  scenario 'Submitting an active document' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    new_document_page.form.fill_in_summary
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.continue.click
  end

  scenario 'Submitting an inactive document' do
    new_document_page.form.select_file
    new_document_page.form.fill_in_reference
    new_document_page.form.fill_in_title
    new_document_page.form.fill_in_summary
    choose(@type.english_name)
    select(@language.english_name)
    new_document_page.form.fill_in_content_date
    new_document_page.form.fill_in_publication_date
    new_document_page.form.make_inactive
    new_document_page.form.continue.click
  end

  def expect_1_error_heading
    expect(new_document_page.error_heading).to have_text '1 error prevented this document from being submitted:'
  end

  def expect_missing_reference_error
    expect(new_document_page.error_messages).to have_text 'Code cannot be blank'
  end

  def expect_missing_file_error
    expect(new_document_page.error_messages).to have_text 'A file must be chosen to upload'
  end

  def expect_missing_language_error
    expect(new_document_page.error_messages).to have_text 'Language cannot be blank'
  end

  def expect_missing_publication_date_error
    expect(new_document_page.error_messages).to have_text 'Publication date cannot be blank'
  end

  def expect_missing_summary_error
    expect(new_document_page.error_messages).to have_text 'Title cannot be blank'
  end

  def expect_missing_title_error
    expect(new_document_page.error_messages).to have_text 'Title cannot be blank'
  end

  def expect_missing_type_error
    expect(new_document_page.error_messages).to have_text 'Document type must be selected'
  end

  def expect_missing_version_date_error
    expect(new_document_page.error_messages).to have_text 'Document version date cannot be blank'
  end
end

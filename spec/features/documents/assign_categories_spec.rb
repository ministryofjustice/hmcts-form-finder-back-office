require 'rails_helper'

feature 'To a document' do
  let(:category_attributes) { { english_name: "Magistrates' Court", welsh_name: 'Llys Ynadon' } }
  let(:language_attributes) { { english_name: 'English', welsh_name: 'Saesneg', code: 'eng' } }
  let(:type_attributes) { { english_name: 'Form', welsh_name: 'Ffurflen' } }

  background do
    @category = Category.create! category_attributes
    @language = Language.create! language_attributes
    @type = DocAttachmentType.create! type_attributes
    @user = create(:user)

    login_page.load
    login_page.log_in(@user.email, @user.password)
    documents_index_page.add_document_button.click
  end

  scenario 'assign a category' do
    create_document_entry
    expect(assign_categories_page).to have_text 'No categories'
    select(@category.english_name)
    click_on('Assign')
  end

  scenario 'assign a category then remove it' do
    create_document_entry
    select(@category.english_name)
    click_on('Assign')
    expect(assign_categories_page.assignment_list).to have_text "Magistrates' Court"
    click_on('Remove this')
    expect(assign_categories_page.assignment_list).to have_text 'No categories'
  end

  def create_document_entry
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
end

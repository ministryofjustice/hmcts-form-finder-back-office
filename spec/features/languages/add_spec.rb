require 'rails_helper'

feature 'Adding languages' do
  background do
    @user           = create(:user)
    @english_name   = 'Chinese (simplified)'
    @welsh_name     = 'Tsieineaidd (symleiddiedig)'
    @language_code  = 'zho'
    @active         = false
    @inactive       = true

    login_page.load
    login_page.log_in(@user.email, @user.password)

    click_on('Languages')
    click_on('Add language')
  end

  scenario 'Submit a blank form' do
    new_language_page.submit.click
    expect_missing_name_and_language_code_error
  end

  scenario 'Add a language with just an English name' do
    fill_form_in_with(@english_name, '', '', @active)
    expect_missing_language_code_error
  end

  scenario 'Add a language with just a Welsh name' do
    fill_form_in_with('', @welsh_name, '', @active)
    expect_missing_language_code_error
  end

  scenario 'Add a language with English and Welsh names' do
    fill_form_in_with(@english_name, @welsh_name, '', @active)
    expect_missing_language_code_error
  end

  scenario 'Add an inactive language with no names or code' do
    fill_form_in_with('', '', '', @inactive)
    expect_missing_name_and_language_code_error
  end

  scenario 'Add an inactive language with an English name' do
    fill_form_in_with(@english_name, '', '', @inactive)
    expect_missing_language_code_error
  end

  scenario 'Add an inactive language with a Welsh name' do
    fill_form_in_with('', @welsh_name, '', @inactive)
    expect_missing_language_code_error
  end

  scenario 'Add an inactive language with Welsh and English names' do
    fill_form_in_with(@english_name, @welsh_name, '', @inactive)
    expect_missing_language_code_error
  end

  scenario 'Add a language with just a language code' do
    fill_form_in_with('', '', @language_code, @active)
    expect_missing_english_or_welsh_name_error
  end

  scenario 'Add an inactive language with just a language code' do
    fill_form_in_with('', '', @language_code, @inactive)
    expect_missing_english_or_welsh_name_error
  end

  scenario 'Add a language with a Welsh name and language code' do
    fill_form_in_with('', @welsh_name, @language_code, @active)
    language_successfully_added
    index_page_lists_should_show('', @welsh_name, @language_code, @active)
  end

  scenario 'Add an inactive language with a Welsh name and language code' do
    fill_form_in_with('', @welsh_name, @language_code, @inactive)
    language_successfully_added
    index_page_lists_should_show('', @welsh_name, @language_code, @inactive)
  end

  scenario 'Add a language with an English name and language code' do
    fill_form_in_with(@english_name, '', @language_code, @active)
    language_successfully_added
    index_page_lists_should_show(@english_name, '', @language_code, @active)
  end

  scenario 'Add an inactive language with an English name and language code' do
    fill_form_in_with(@english_name, '', @language_code, @inactive)
    language_successfully_added
    index_page_lists_should_show(@english_name, '', @language_code, @inactive)
  end

  scenario 'Add a language with an English name, Welsh name and language code' do
    fill_form_in_with(@english_name, @welsh_name, @language_code, @active)
    language_successfully_added
    index_page_lists_should_show(@english_name, @welsh_name, @language_code, @active)
  end

  scenario 'Add an inactive language with an English name, Welsh name and language code' do
    fill_form_in_with(@english_name, @welsh_name, @language_code, @inactive)
    language_successfully_added
    index_page_lists_should_show(@english_name, @welsh_name, @language_code, @inactive)
  end

  def expect_missing_english_or_welsh_name_error
    new_language_page.submit.click
    expect(new_language_page.error_heading).to have_text '1 error prevented this language from being submitted:'
    expect(new_language_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  def expect_missing_language_code_error
    new_language_page.submit.click
    expect(new_language_page.error_heading).to have_text '1 error prevented this language from being submitted:'
    language_code_error_text
  end

  def expect_missing_name_and_language_code_error
    new_language_page.submit.click
    expect(new_language_page.error_heading).to have_text '2 errors prevented this language from being submitted:'
    language_code_error_text
    no_name_error_text
  end

  def fill_form_in_with(english, welsh, code, state)
    new_language_page.fill_in_field('language_english_name', english)
    new_language_page.fill_in_field('language_welsh_name', welsh)
    new_language_page.fill_in_field('language_code', code)
    new_language_page.toggle_inactive('language_inactive', state)
    new_language_page.submit.click
  end

  def index_page_lists_should_show(english_name, welsh_name, language_code, state)
    if state == true
      expect(languages_index_page.sub_heading).to have_text 'Currently 0 languages are active and 1 inactive'
      expect(languages_index_page).to have_selector('#active_list tbody tr', count: 0)
      expect(languages_index_page).to have_selector('#inactive_list tbody tr', count: 1)
      expect(languages_index_page.inactive_list.english_name).to have_text english_name
      expect(languages_index_page.inactive_list.welsh_name).to have_text welsh_name
      expect(languages_index_page.inactive_list.code).to have_text language_code
    else
      expect(languages_index_page.sub_heading).to have_text 'Currently 1 language is active'
      expect(languages_index_page).to have_selector('#active_list tbody tr', count: 1)
      expect(languages_index_page).to have_selector('#inactive_list tbody tr', count: 0)
      expect(languages_index_page.active_list.english_name).to have_text english_name
      expect(languages_index_page.active_list.welsh_name).to have_text welsh_name
      expect(languages_index_page.active_list.code).to have_text language_code
    end
  end

  def language_code_error_text
    expect(new_language_page.error_message).to have_text 'Language code cannot be blank'
  end

  def language_successfully_added
    expect(show_language_page.creation_notice).to be_present
    show_language_page.done.click
  end

  def no_name_error_text
    expect(new_language_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end
end

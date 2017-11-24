require 'rails_helper'

feature 'Adding categories' do
  # before(:all) do
  background do
    @user = create(:user)
    login_page.load
    login_page.log_in(@user.email, @user.password)
    click_on('Languages')
  end

  scenario 'Add an active empty language' do
    click_on('Add language')

    click_on('Submit')

    expect(new_language_page.error_heading).to have_text '2 errors prevented this language from being submitted:'
    expect(new_language_page.error_message).to have_text 'Language code cannot be blank'
    expect(new_language_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  scenario 'Add an active language (English only)' do
    click_on('Add language')

    new_language_page.fill_in_field('language_english_name', 'English')
    new_language_page.fill_in_field('language_code', 'Eng')
    click_on('Submit')

    expect(show_language_page.creation_notice).to be_present
    click_on('Done')

    expect(languages_index_page.sub_heading).to have_text 'Currently 1 language is active'
  end
end

require 'rails_helper'

feature 'Adding languages' do
  background do
    @user = create(:user)
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
    new_language_page.fill_in_field('language_english_name', 'Arabic')
    new_language_page.submit.click
    expect_missing_language_code_error
  end

  scenario 'Add a language with just a Welsh name' do
    new_language_page.fill_in_field('language_welsh_name', 'Amaraeg')
    new_language_page.submit.click
    expect_missing_language_code_error
  end

  scenario 'Add a language with English and Welsh names' do
    new_language_page.fill_in_field('language_english_name', 'Czech')
    new_language_page.fill_in_field('language_welsh_name', 'Tsiec')
    new_language_page.submit.click
    expect_missing_language_code_error
  end

  scenario 'Add an inactive language with no names' do
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect_missing_name_and_language_code_error
  end

  scenario 'Add an inactive language with an English name' do
    new_language_page.fill_in_field('language_english_name', 'Farsi')
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect_missing_language_code_error
  end

  scenario 'Add an inactive language with a Welsh name' do
    new_language_page.fill_in_field('language_welsh_name', 'Saesneg')
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect_missing_language_code_error
  end

  scenario 'Add an inactive language with Welsh and English names' do
    new_language_page.fill_in_field('language_english_name', 'Gujarati')
    new_language_page.fill_in_field('language_welsh_name', 'Gwjarati')
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect_missing_language_code_error
  end

  scenario 'Add a language with just a language code' do
    new_language_page.fill_in_field('language_code', 'pol')
    new_language_page.submit.click
    expect_missing_english_or_welsh_name_error
  end

  scenario 'Add an inactive language with just a language code' do
    new_language_page.fill_in_field('language_code', 'por')
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect_missing_english_or_welsh_name_error
  end

  scenario 'Add a language with a Welsh name and language code' do
    new_language_page.fill_in_field('language_welsh_name', 'Sbaeneg')
    new_language_page.fill_in_field('language_code', 'spa')
    new_language_page.submit.click
    expect(show_language_page.creation_notice).to be_present
    show_language_page.done.click
    expect(languages_index_page.sub_heading).to have_text 'Currently 1 language is active'
    expect_the_active_language_list_to_be_populated
    expect(languages_index_page.active_list.english_name).to have_text ''
    expect(languages_index_page.active_list.welsh_name).to have_text 'Sbaeneg'
    expect(languages_index_page.active_list.code).to have_text 'spa'
  end

  scenario 'Add an inactive language with a Welsh name and language code' do
    new_language_page.fill_in_field('language_welsh_name', 'Twrcaidd')
    new_language_page.fill_in_field('language_code', 'tur')
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect(show_language_page.creation_notice).to be_present
    show_language_page.done.click
    expect(languages_index_page.sub_heading).to have_text 'Currently 0 languages are active and 1 inactive'
    expect_the_inactive_language_list_to_be_populated
    expect(languages_index_page.inactive_list.english_name).to have_text ''
    expect(languages_index_page.inactive_list.welsh_name).to have_text 'Twrcaidd'
    expect(languages_index_page.inactive_list.code).to have_text 'tur'
  end

  scenario 'Add a language with an English name and language code' do
    new_language_page.fill_in_field('language_english_name', '﻿Bengali')
    new_language_page.fill_in_field('language_code', 'ben')
    new_language_page.submit.click
    expect(show_language_page.creation_notice).to be_present
    show_language_page.done.click
    expect(languages_index_page.sub_heading).to have_text 'Currently 1 language is active'
    expect_the_active_language_list_to_be_populated
    expect(languages_index_page.active_list.english_name).to have_text 'Bengali'
    expect(languages_index_page.active_list.welsh_name).to have_text ''
    expect(languages_index_page.active_list.code).to have_text 'ben'
  end

  scenario 'Add an inactive language with an English name and language code' do
    new_language_page.fill_in_field('language_english_name', 'Amharic')
    new_language_page.fill_in_field('language_code', 'amh')
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect(show_language_page.creation_notice).to be_present
    show_language_page.done.click
    expect(languages_index_page.sub_heading).to have_text 'Currently 0 languages are active and 1 inactive'
    expect_the_inactive_language_list_to_be_populated
    expect(languages_index_page.inactive_list.english_name).to have_text 'Amharic'
    expect(languages_index_page.inactive_list.welsh_name).to have_text ''
    expect(languages_index_page.inactive_list.code).to have_text 'amh'
  end

  scenario 'Add a language with an English name, Welsh name and language code' do
    new_language_page.fill_in_field('language_english_name', 'Chinese (simplfied)')
    new_language_page.fill_in_field('language_welsh_name', 'Tsieineaidd (symleiddiedig)')
    new_language_page.fill_in_field('language_code', 'zho')
    new_language_page.submit.click
    expect(show_language_page.creation_notice).to be_present
    show_language_page.done.click
    expect(languages_index_page.sub_heading).to have_text 'Currently 1 language is active'
    expect_the_active_language_list_to_be_populated
    expect(languages_index_page.active_list.english_name).to have_text 'Chinese (simplfied)'
    expect(languages_index_page.active_list.welsh_name).to have_text 'Tsieineaidd (symleiddiedig)'
    expect(languages_index_page.active_list.code).to have_text 'zho'
  end

  scenario 'Add an inactive language with an English name, Welsh name and language code' do
    new_language_page.fill_in_field('language_english_name', 'French')
    new_language_page.fill_in_field('language_welsh_name', 'Ffrangeg')
    new_language_page.fill_in_field('language_code', 'fre')
    new_language_page.toggle_inactive('language_inactive', 'true')
    new_language_page.submit.click
    expect(show_language_page.creation_notice).to be_present
    show_language_page.done.click
    expect(languages_index_page.sub_heading).to have_text 'Currently 0 languages are active and 1 inactive'
    expect_the_inactive_language_list_to_be_populated
    expect(languages_index_page.inactive_list.english_name).to have_text 'French'
    expect(languages_index_page.inactive_list.welsh_name).to have_text 'Ffrangeg'
    expect(languages_index_page.inactive_list.code).to have_text 'fre'
  end

  def expect_missing_language_code_error
    expect(new_language_page.error_heading).to have_text '1 error prevented this language from being submitted:'
    expect(new_language_page.error_message).to have_text 'Language code cannot be blank'
  end

  def expect_missing_english_or_welsh_name_error
    expect(new_language_page.error_heading).to have_text '1 error prevented this language from being submitted:'
    expect(new_language_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  def expect_missing_name_and_language_code_error
    expect(new_language_page.error_heading).to have_text '2 errors prevented this language from being submitted:'
    expect(new_language_page.error_message).to have_text 'Language code cannot be blank'
    expect(new_language_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  def expect_the_active_language_list_to_be_populated
    expect(languages_index_page).to have_selector('#active_list tbody tr', count: 1)
    expect(languages_index_page).to have_selector('#inactive_list tbody tr', count: 0)
  end

  def expect_the_inactive_language_list_to_be_populated
    expect(languages_index_page).to have_selector('#active_list tbody tr', count: 0)
    expect(languages_index_page).to have_selector('#inactive_list tbody tr', count: 1)
  end
end

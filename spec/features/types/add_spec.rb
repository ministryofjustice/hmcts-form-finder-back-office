require 'rails_helper'

feature 'Adding types' do
  background do
    @user = create(:user)
    login_page.load
    login_page.log_in(@user.email, @user.password)
    click_on('Document types')
    click_on('Add type')
  end

  scenario 'Add an active empty document type' do
    click_on('Submit')
    expect(new_type_page.error_heading).to have_text '1 error prevented this type from being submitted:'
    expect(new_type_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  scenario 'Add an active English type' do
    new_type_page.fill_in_field('doc_attachment_type_english_name', 'Form')
    click_on('Submit')
    expect(show_type_page.creation_notice).to be_present
    click_on('Done')
    expect(types_index_page.sub_heading).to have_text 'Currently 1 document type is active'
    expect(types_index_page).to have_selector('#active_list tbody tr', count: 1)
    expect(types_index_page).to have_selector('#inactive_list tbody tr', count: 0)
    expect(types_index_page.active_list.english_name).to have_text 'Form'
    expect(types_index_page.active_list.welsh_name).to have_text ''
  end

  scenario 'Add an active Welsh type' do
    new_type_page.fill_in_field('doc_attachment_type_welsh_name', 'Ffurflen')
    click_on('Submit')
    expect(show_type_page.creation_notice).to be_present
    click_on('Done')
    expect(types_index_page.sub_heading).to have_text 'Currently 1 document type is active'
    expect(types_index_page).to have_selector('#active_list tbody tr', count: 1)
    expect(types_index_page).to have_selector('#inactive_list tbody tr', count: 0)
    expect(types_index_page.active_list.english_name).to have_text ''
    expect(types_index_page.active_list.welsh_name).to have_text 'Ffurflen'
  end

  scenario 'Add an active English and Welsh type' do
    new_type_page.fill_in_field('doc_attachment_type_english_name', 'Guidance')
    new_type_page.fill_in_field('doc_attachment_type_welsh_name', 'Arweiniad')
    click_on('Submit')
    expect(show_type_page.creation_notice).to be_present
    click_on('Done')
    expect(types_index_page.sub_heading).to have_text 'Currently 1 document type is active'
    expect(types_index_page).to have_selector('#active_list tbody tr', count: 1)
    expect(types_index_page).to have_selector('#inactive_list tbody tr', count: 0)
    expect(types_index_page.active_list.english_name).to have_text 'Guidance'
    expect(types_index_page.active_list.welsh_name).to have_text 'Arweiniad'
  end

  scenario 'Add an inactive nameless type' do
    new_type_page.toggle_inactive('doc_attachment_type_inactive', 'true')
    click_on('Submit')
    expect(new_type_page.error_heading).to have_text '1 error prevented this type from being submitted:'
    expect(new_type_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  scenario 'Add an inactive English type' do
    new_type_page.fill_in_field('doc_attachment_type_english_name', 'Leaflet')
    new_type_page.toggle_inactive('doc_attachment_type_inactive', 'true')
    click_on('Submit')
    expect(show_type_page.creation_notice).to be_present
    click_on('Done')
    expect(types_index_page.sub_heading).to have_text 'Currently 0 document types are active and 1 inactive'
    expect(types_index_page).to have_selector('#active_list tbody tr', count: 0)
    expect(types_index_page).to have_selector('#inactive_list tbody tr', count: 1)
    expect(types_index_page.inactive_list.english_name).to have_text 'Leaflet'
    expect(types_index_page.inactive_list.welsh_name).to have_text ''
  end

  scenario 'Add an inactive Welsh type' do
    new_type_page.fill_in_field('doc_attachment_type_welsh_name', 'Taflen')
    new_type_page.toggle_inactive('doc_attachment_type_inactive', 'true')
    click_on('Submit')
    expect(show_type_page.creation_notice).to be_present
    click_on('Done')
    expect(types_index_page.sub_heading).to have_text 'Currently 0 document types are active and 1 inactive'
    expect(types_index_page).to have_selector('#active_list tbody tr', count: 0)
    expect(types_index_page).to have_selector('#inactive_list tbody tr', count: 1)
    expect(types_index_page.inactive_list.english_name).to have_text ''
    expect(types_index_page.inactive_list.welsh_name).to have_text 'Taflen'
  end

  scenario 'Add an inactive type' do
    new_type_page.fill_in_field('doc_attachment_type_english_name', '﻿Notes')
    new_type_page.fill_in_field('doc_attachment_type_welsh_name', '﻿Nodiadau')
    new_type_page.toggle_inactive('doc_attachment_type_inactive', 'true')
    click_on('Submit')
    expect(show_type_page.creation_notice).to be_present
    click_on('Done')
    expect(types_index_page.sub_heading).to have_text 'Currently 0 document types are active and 1 inactive'
    expect(types_index_page).to have_selector('#active_list tbody tr', count: 0)
    expect(types_index_page).to have_selector('#inactive_list tbody tr', count: 1)
    expect(types_index_page.inactive_list.english_name).to have_text '﻿Notes'
    expect(types_index_page.inactive_list.welsh_name).to have_text '﻿Nodiadau'
  end
end

require 'rails_helper'

feature 'Adding categories' do
  background do
    @user = create(:user)
    login_page.load
    login_page.log_in(@user.email, @user.password)
    click_on('Categories')
    click_on('Add category')
  end

  scenario 'Add an active empty category' do
    click_on('Submit')
    expect(new_category_page.error_heading).to have_text '1 error prevented this category from being submitted:'
    expect(new_category_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  scenario 'Add an active English category' do
    new_category_page.fill_in_field('category_english_name', 'Divorce / Civil Partnership Dissolution')
    click_on('Submit')
    expect(show_category_page.creation_notice).to be_present
    click_on('Done')
    expect(categories_index_page.sub_heading).to have_text 'Currently 1 category is active'
    expect(categories_index_page).to have_selector('#active_list tbody tr', count: 1)
    expect(categories_index_page).to have_selector('#inactive_list tbody tr', count: 0)
    expect(categories_index_page.active_list.english_name).to have_text 'Divorce / Civil Partnership Dissolution'
    expect(categories_index_page.active_list.welsh_name).to have_text ''
  end

  scenario 'Add an active Welsh category' do
    new_category_page.fill_in_field('category_welsh_name', 'Llysoedd Barn Brenhinol')
    click_on('Submit')
    expect(show_category_page.creation_notice).to be_present
    click_on('Done')
    expect(categories_index_page.sub_heading).to have_text 'Currently 1 category is active'
    expect(categories_index_page).to have_selector('#active_list tbody tr', count: 1)
    expect(categories_index_page).to have_selector('#inactive_list tbody tr', count: 0)
    expect(categories_index_page.active_list.english_name).to have_text ''
    expect(categories_index_page.active_list.welsh_name).to have_text 'Llysoedd Barn Brenhinol'
  end

  scenario 'Add an active English and Welsh category' do
    new_category_page.fill_in_field('category_english_name', 'Tax and Chancery Chamber (Upper Tribunal)')
    new_category_page.fill_in_field('category_welsh_name', 'Siambr Treth a Siawnsri (Uwch Dribiwnlys)')
    click_on('Submit')
    expect(show_category_page.creation_notice).to be_present
    click_on('Done')
    expect(categories_index_page.sub_heading).to have_text 'Currently 1 category is active'
    expect(categories_index_page).to have_selector('#active_list tbody tr', count: 1)
    expect(categories_index_page).to have_selector('#inactive_list tbody tr', count: 0)
    expect(categories_index_page.active_list.english_name).to have_text 'Tax and Chancery Chamber (Upper Tribunal)'
    expect(categories_index_page.active_list.welsh_name).to have_text 'Siambr Treth a Siawnsri (Uwch Dribiwnlys)'
  end

  scenario 'Add an inactive nameless category' do
    new_category_page.toggle_inactive('category_inactive', 'true')
    click_on('Submit')
    expect(new_category_page.error_heading).to have_text '1 error prevented this category from being submitted:'
    expect(new_category_page.error_message).to have_text 'An English and/or Welsh name must be supplied'
  end

  scenario 'Add an inactive English category' do
    new_category_page.fill_in_field('category_english_name', 'Reserve Forces Tribunal')
    new_category_page.toggle_inactive('category_inactive', 'true')
    click_on('Submit')
    expect(show_category_page.creation_notice).to be_present
    click_on('Done')
    expect(categories_index_page.sub_heading).to have_text 'Currently 0 categories are active and 1 inactive'
    expect(categories_index_page).to have_selector('#active_list tbody tr', count: 0)
    expect(categories_index_page).to have_selector('#inactive_list tbody tr', count: 1)
    expect(categories_index_page.inactive_list.english_name).to have_text 'Reserve Forces Tribunal'
    expect(categories_index_page.inactive_list.welsh_name).to have_text ''
  end

  scenario 'Add an inactive Welsh category' do
    new_category_page.fill_in_field('category_welsh_name', 'Llysoedd Barn Brenhinol')
    new_category_page.toggle_inactive('category_inactive', 'true')
    click_on('Submit')
    expect(show_category_page.creation_notice).to be_present
    click_on('Done')
    expect(categories_index_page.sub_heading).to have_text 'Currently 0 categories are active and 1 inactive'
    expect(categories_index_page).to have_selector('#active_list tbody tr', count: 0)
    expect(categories_index_page).to have_selector('#inactive_list tbody tr', count: 1)
    expect(categories_index_page.inactive_list.english_name).to have_text ''
    expect(categories_index_page.inactive_list.welsh_name).to have_text 'Llysoedd Barn Brenhinol'
  end

  scenario 'Add an inactive category' do
    new_category_page.fill_in_field('category_english_name', '﻿Probate')
    new_category_page.fill_in_field('category_welsh_name', '﻿Profiant')
    new_category_page.toggle_inactive('category_inactive', 'true')
    click_on('Submit')
    expect(show_category_page.creation_notice).to be_present
    click_on('Done')
    expect(categories_index_page.sub_heading).to have_text 'Currently 0 categories are active and 1 inactive'
    expect(categories_index_page).to have_selector('#active_list tbody tr', count: 0)
    expect(categories_index_page).to have_selector('#inactive_list tbody tr', count: 1)
    expect(categories_index_page.inactive_list.english_name).to have_text '﻿Probate'
    expect(categories_index_page.inactive_list.welsh_name).to have_text '﻿Profiant'
  end
end

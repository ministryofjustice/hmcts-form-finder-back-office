require 'rails_helper'

feature "HMCTS Users should be able to upload and process forms/leaflets" do

  let!(:user) { create :user }
  let!(:language) { create :language }
  let!(:type) { create :doc_attachment_type }

  background do
    login_as(user, :scope => :user)
  end

  scenario "from the home page upload and process 1 form" do
    visit documents_path
    click_link 'Add documents'

    within("#new_document") do
      fill_in 'Code', with: Faker::Lorem.characters(8)
      fill_in 'Title', with: Faker::Lorem.characters(8)
      select type.english_name, from: 'Type'
      attach_file 'Choose a file to upload', Rails.root.join('spec/support/fixtures/Blank.docx')

      fill_in 'Day', with: Time.zone.now.day
      fill_in 'Month', with: Time.zone.now.month
      fill_in 'Year', with: Time.zone.now.year

      click_button 'Submit document'
    end

    expect(page).to have_content 'Successfully submitted'
  end

  scenario "from the home page upload and process multiple forms" do
    skip 'allows the user to upload a form'
    skip 'allows user to fill in the details for the form'
  end
end

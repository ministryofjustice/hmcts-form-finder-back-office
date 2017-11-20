require 'rails_helper'

feature 'HMCTS Users should be able to upload and process forms/leaflets' do
  let!(:user) { create :user }
  let!(:language) { create :language }
  let!(:type) { create :doc_attachment_type }

  background do
    login_as(user, scope: :user)
  end

  scenario 'from the home page upload and process 1 form' do
    visit documents_path
    click_link 'Add document'

    within('#new_document') do
      fill_in 'Reference', with: Faker::Lorem.characters(8)
      fill_in 'Title', with: Faker::Lorem.characters(8)
      fill_in 'Summary', with: Faker::Lorem.characters(132)
      # select type.english_name, from: 'Type'
      choose type.english_name
      choose language.english_name
      attach_file 'Choose document', Rails.root.join('spec/support/fixtures/Blank.docx')

      fill_in 'document_published_date_dd', with: Time.zone.now.day
      fill_in 'document_published_date_mm', with: Time.zone.now.month
      fill_in 'document_published_date_yyyy', with: Time.zone.now.year

      fill_in 'document_content_date_dd', with: Time.zone.now.day
      fill_in 'document_content_date_mm', with: Time.zone.now.month
      fill_in 'document_content_date_yyyy', with: Time.zone.now.year

      click_button 'Continue'
    end
  end
end
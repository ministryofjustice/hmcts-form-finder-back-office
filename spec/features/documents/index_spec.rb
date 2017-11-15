require 'rails_helper'

feature 'Document index' do
  background do
    @user = create(:user)
  end

  before do
    login_page.load
    login_page.log_in(@user.email, @user.password)
  end

  describe 'Documents index/landing page' do
    it 'contains the following content:' do
      expect(documents_index_page.heading).to be_present
      expect(documents_index_page.add_document_subheading).to be_present
      expect(documents_index_page.add_document_button).to be_present
      expect(documents_index_page.edit_document_subheading).to be_present
      # expect(documents_index_page.auto_suggest_list).to be_present
      expect(documents_index_page.edit_document_button).to be_present
      expect(documents_index_page.publishing_queue_subheading).to be_present
    end
  end

  scenario 'Go to the categories page' do
    click_on('Categories')
  end
end

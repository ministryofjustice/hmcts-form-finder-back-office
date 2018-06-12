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
      navigation_links = documents_index_page.navigation.all_links
      expect(navigation_links.count).to eq 2
      expect(navigation_links[1]).to have_text('User accounts')
    end
  end
end

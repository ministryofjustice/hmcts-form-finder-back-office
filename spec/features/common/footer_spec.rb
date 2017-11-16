require 'rails_helper'

feature 'Footer Section' do
  before do
    login_page.load
  end
  describe 'The footer section' do
    it 'contains the following content:' do
      expect(login_page.footer.ogl_link).to be_present
      expect(login_page.footer.ogl_text).to have_text('All content is available under the Open Government Licence v3.0, except where otherwise stated')
      expect(login_page.footer.copyright_text).to have_text('© Crown copyright')
      expect(login_page.footer.copyright_link).to be_present
      # save_and_open_page
    end
  end
end

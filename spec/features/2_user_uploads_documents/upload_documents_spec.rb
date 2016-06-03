require 'rails_helper'

feature "HMCTS Users should be able to upload and process forms/leaflets" do
  background do
    user = create(:user)
    login_as(user, :scope => :user)
  end

  scenario "from the home page upload and process 1 form" do
    skip 'allows the user to upload a form'
    skip 'allows user to fill in the details for the form'
  end

  scenario "from the home page upload and process multiple forms" do
    skip 'allows the user to upload a form'
    skip 'allows user to fill in the details for the form'
  end

end
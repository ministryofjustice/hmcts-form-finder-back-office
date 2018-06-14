require 'rails_helper'

feature 'Signing in' do
  background do
    @user = create(:user)
  end

  before do
    login_page.load
    expect(login_page.sign_in_heading).to be_present
  end

  scenario 'using an invalid email address' do
    login_page.log_in(Faker::Internet.email, @user.password)
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'using an invalid password' do
    login_page.log_in(@user.email, Faker::Lorem.characters(8))
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'using an invalid email address and password' do
    login_page.log_in(Faker::Internet.email, Faker::Lorem.characters(8))
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'with correct credentials' do
    login_page.log_in(@user.email, @user.password)
    expect(page).to have_content 'Signed in successfully.'
  end
end

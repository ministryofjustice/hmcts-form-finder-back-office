require 'rails_helper'

feature 'Signing in' do
  background do
    @user = create(:user)
  end

  before do
    login_page.load
    expect(login_page).to have_content 'Sign in'
  end

  scenario 'Signing in with correct credentials' do
    login_page.log_in(@user.email, @user.password)
    expect(login_page).to have_content 'Signed in successfully.'
  end

  scenario 'Signing in using invalid email' do
    login_page.log_in(Faker::Internet.email, @user.password)
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'Signing in using invalid password' do
    login_page.log_in(@user.email, Faker::Lorem.characters(8))
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'Signing in using invalid email and password' do
    login_page.log_in(Faker::Internet.email, Faker::Lorem.characters(8))
    expect(page).to have_content 'Invalid email or password'
  end
end

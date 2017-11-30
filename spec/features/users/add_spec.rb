require 'rails_helper'

feature 'Adding user accounts' do
  background do
    @user = create(:user)
    @new_user = create(:user)
    login_page.load
    login_page.log_in(@user.email, @user.password)
    click_on('User accounts')
    click_on('Add user')
  end

  scenario 'Add an active account without firstname' do
    new_user_page.set_user('', @new_user.last_name, Faker::Internet.safe_email, @new_user.password, @new_user.password_confirmation)
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '1 error prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'First name cannot be blank'
  end

  scenario 'Add an active account without surname' do
    new_user_page.set_user(@new_user.first_name, '', Faker::Internet.safe_email, @new_user.password, @new_user.password_confirmation)
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '1 error prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'Surname cannot be blank'
  end

  scenario 'Add an active account without email' do
    new_user_page.set_user(@new_user.first_name, @new_user.last_name, '', @new_user.password, @new_user.password_confirmation)
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '1 error prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'Email address cannot be blank'
  end

  scenario 'Add an active account without password' do
    new_user_page.set_user(@new_user.first_name, @new_user.last_name, Faker::Internet.safe_email, '', @new_user.password_confirmation)
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '2 errors prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'Password cannot be blank'
    expect(new_user_page.error_message).to have_text "Confirmation password doesn't match Password"
  end

  scenario 'Add an active account without password confirmation' do
    new_user_page.set_user(@new_user.first_name, @new_user.last_name, Faker::Internet.safe_email, @new_user.password, '')
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '1 error prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text "Confirmation password doesn't match Password"
  end

  scenario 'Add an active account' do
    new_user_page.set_user('Dominic', 'Todd', 'dominic.todd@example.com', @new_user.password, @new_user.password_confirmation)
    new_user_page.submit.click
    expect(show_user_page.creation_notice).to be_present
    show_user_page.done.click
    expect(users_index_page.sub_heading).to have_text 'Currently 3 users are active'
    expect(users_index_page).to have_selector('#active_list tbody tr', count: 3)
    expect(users_index_page).to have_selector('#inactive_list tbody tr', count: 0)
    expect(users_index_page.active_list).to have_text 'Dominic Todd'
    expect(users_index_page.active_list).to have_text 'dominic.todd@example.com'
  end

  scenario 'Add an inactive account' do
    new_user_page.set_user('Jennifer', 'Boyd', 'jennifer.boyd@example.com', @new_user.password, @new_user.password_confirmation)
    new_user_page.set_inative
    new_user_page.submit.click
    expect(show_user_page.creation_notice).to be_present
    show_user_page.done.click
    expect(users_index_page.sub_heading).to have_text 'Currently 2 users are active and 1 inactive'
    expect(users_index_page).to have_selector('#active_list tbody tr', count: 2)
    expect(users_index_page).to have_selector('#inactive_list tbody tr', count: 1)
    expect(users_index_page.inactive_list).to have_text 'Jennifer Boyd'
    expect(users_index_page.inactive_list).to have_text 'jennifer.boyd@example.com'
  end

  scenario 'Submit a blank form' do
    new_user_page.set_user('', '', '', '', '')
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '4 errors prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'First name cannot be blank'
    expect(new_user_page.error_message).to have_text 'Surname cannot be blank'
    expect(new_user_page.error_message).to have_text 'Email address cannot be blank'
    expect(new_user_page.error_message).to have_text 'Password cannot be blank'
  end

  scenario 'Set a password with < 8 characters (lowercase letters only)' do
    new_user_page.set_user(@new_user.first_name, @new_user.last_name, Faker::Internet.safe_email, 'what', 'what')
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '2 errors prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'Password is too short (minimum is 8 characters)'
    expect(new_user_page.error_message).to have_text 'Password must include at least one lowercase letter, one uppercase letter, and one digit, and one of !@#$%&*'
  end

  scenario 'Set an 8 character (lower case letters only) password' do
    new_user_page.set_user(@new_user.first_name, @new_user.last_name, Faker::Internet.safe_email, 'whatever', 'whatever')
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '1 error prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'Password must include at least one lowercase letter, one uppercase letter, and one digit, and one of !@#$%&*'
  end

  scenario 'Set an 8 character (mixture of lower case letters and numbers) password' do
    new_user_page.set_user(@new_user.first_name, @new_user.last_name, Faker::Internet.safe_email, 'what3ver', 'what3ver')
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '1 error prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'Password must include at least one lowercase letter, one uppercase letter, and one digit, and one of !@#$%&*'
  end

  scenario 'Set an 8 character (mixture of upper and lower case letters & numbers) password' do
    new_user_page.set_user(@new_user.first_name, @new_user.last_name, Faker::Internet.safe_email, 'What3ver', 'What3ver')
    new_user_page.submit.click
    expect(new_user_page.error_heading).to have_text '1 error prevented this user from being submitted:'
    expect(new_user_page.error_message).to have_text 'Password must include at least one lowercase letter, one uppercase letter, and one digit, and one of !@#$%&*'
  end
end

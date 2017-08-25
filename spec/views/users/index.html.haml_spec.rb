require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:active_users, [
             User.create!(
               first_name: 'First Name',
               last_name: 'Last Name',
               email: 'Email0@email.com',
               password: 'Encrypted Password'
             ),
             User.create!(
               first_name: 'First Name1',
               last_name: 'Last Name1',
               email: 'Email10@email1.com',
               password: 'Encrypted Password'
             )
           ])
    assign(:inactive_users, [
             User.create!(
               first_name: 'First Name2',
               last_name: 'Last Name2',
               email: 'Email0@email2.com',
               password: 'Encrypted Password'
             ),
             User.create!(
               first_name: 'First Name3',
               last_name: 'Last Name3',
               email: 'Email10@email3.com',
               password: 'Encrypted Password'
             )
           ])
  end

  it 'renders a list of users' do
    render
    # assert_select 'tr>td', :text => 'Email'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'Password'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'First Name'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'Last Name'.to_s, :count => 2
  end
end

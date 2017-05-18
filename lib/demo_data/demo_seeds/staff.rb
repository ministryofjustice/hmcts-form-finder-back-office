# Notes
# Creates demo user accounts
require 'csv'
require Rails.root.join('db', 'seed_helper')

SeedHelper.find_or_create_user!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'staff@example.com',
  password_env_var: 'COMMS_STAFF_PASSWORD'
)

SeedHelper.find_or_create_user!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: 'staff2@example.com',
  password_env_var: 'COMMS_STAFF_PASSWORD'
)

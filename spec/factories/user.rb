# == Schema Information
#
# Table name: users
#
# t.string   "first_name"
# t.string   "last_name"
# t.datetime "created_at",                          null: false
# t.datetime "updated_at",                          null: false
# t.string   "email",                  default: "", null: false
# t.string   "encrypted_password",     default: "", null: false
# t.string   "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.integer  "sign_in_count",          default: 0,  null: false
# t.datetime "current_sign_in_at"
# t.datetime "last_sign_in_at"
# t.inet     "current_sign_in_ip"
# t.inet     "last_sign_in_ip"
#

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'testing123'
    password_confirmation 'testing123'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end

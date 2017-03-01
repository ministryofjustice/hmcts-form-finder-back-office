# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  english_name :string
#  welsh_name   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :category do |c|
    c.english_name {Faker::Name.last_name}
    c.welsh_name {Faker::Name.last_name}
  end
end

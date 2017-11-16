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

FactoryBot.define do
  factory :category do
    english_name 'english name'
    welsh_name 'welsh name'
  end
end

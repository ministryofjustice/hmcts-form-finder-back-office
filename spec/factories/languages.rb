# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  english_name :string
#  welsh_name   :string
#  code         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :language do
    english_name "MyString"
    welsh_name "MyString"
    code "MyString"
  end
end

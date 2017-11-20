# == Schema Information
#
# Table name: documentcategories
#
#  id          :integer          not null, primary key
#  document_id :integer
#  category_id :integer
#  sort_order  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :document_category do
    document
    category
    sequence :sort_order do |n|
      n
    end
  end
end

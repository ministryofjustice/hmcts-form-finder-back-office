FactoryGirl.define do
  factory :document_category do
    document
    category
    sequence :sort_order do |n|
      n
    end
  end
end

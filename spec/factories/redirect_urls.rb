FactoryBot.define do
  factory :redirect_url do
    incoming "MyString"
    outgoing "MyString"
    document_id 1
    category_id 1
    inactive false
  end
end

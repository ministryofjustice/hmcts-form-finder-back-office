FactoryGirl.define do
  factory :category do |c|
    c.english_name {Faker::Name.last_name}
    c.welsh_name {Faker::Name.last_name}
  end
end

FactoryGirl.define do
  factory :document_attachment_type do
    sequence :name do |n|
       "Document type #{n}"
    end
  end
end

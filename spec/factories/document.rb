FactoryGirl.define do
  factory :document do
    doc_attachment_type_id 1
    code "DOC code"
    title "DOC"
    category "MyString"
    attachment { File.new("#{Rails.root}/spec/support/fixtures/Blank.docx") }
    language
    attachment_file_name "Bob"
  end
end

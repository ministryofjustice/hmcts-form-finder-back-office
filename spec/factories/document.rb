# == Schema Information
#
# Table name: documents
#
#  id                       :integer    not null, primary key
#  code                     :string
#  title                    :string
#  doc_attachment_type_id   :integer    not null
#  created_at               :datetime   not null
#  updated_at               :datetime   not null
#  attachment_file_name     :string
#  attachment_content_type  :string
#  attachment_file_size     :integer
#  content_date             :date
#  published_date           :date
#  language_id              :integer
#  original_id              :integer
#  creator_id               :integer
#  inactive                 :boolean
#  original_url             :string
#  file_format              :string
#  summary                  :string(250)
#

FactoryGirl.define do
  factory :document do
    attachment { File.new("#{Rails.root}/spec/support/fixtures/Blank.docx") }
    attachment_file_name 'Bob'
    code 'DOC code'
    content_date '2017-07-01'
    doc_attachment_type_id 1
    language
    published_date '2017-07-18'
    title 'DOC'
  end
end

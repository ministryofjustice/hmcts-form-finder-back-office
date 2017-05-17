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
#  attachment_updated_at    :datetime
#  published_date           :date
#  language_id              :integer
#  original_id              :integer
#  creator_id               :integer
#  original_url             :string
#  file_format              :string
#

require 'rails_helper'

RSpec.describe Document, type: :model do
  it { should belong_to(:creator)}
  it { should belong_to(:doc_attachment_type) }
  it { should belong_to(:language) }

  describe 'validations' do
    it { should validate_presence_of(:doc_attachment_type_id)}
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:language_id) }
  end
  describe 'Saving file' do
    it {should have_attached_file(:attachment)}
  end
  describe 'Rename and save' do
    it 'Has correct extension type ' do
      language = create :language
      document = Document.create(doc_attachment_type_id: 1, code: 'PDF test ', title: 'DOC', :attachment => File.new("#{Rails.root}/spec/support/fixtures/Blank.pdf"), attachment_file_name: 'Blank.pdf', language_id: language.id)
      document.save!
      expect(document.file_format).to eq('PDF')
    end
  end
  it 'documents search works with a query' do
    document = create :document
    @documents = Document.search(document.title)
    expect(@documents).to include(document)
  end
  it 'documents search is case insensitive' do
    language = create :language
    document = Document.create(doc_attachment_type_id: 1, code: 'case insensitive test 555', title: 'DOC', :attachment => File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    @documents = Document.search('TEST')
    expect(@documents).to include(document)
  end
end

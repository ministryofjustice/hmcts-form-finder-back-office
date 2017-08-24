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

require 'rails_helper'

RSpec.describe Document, type: :model do
  it { should belong_to(:creator) }
  it { should belong_to(:doc_attachment_type) }
  it { should belong_to(:language) }

  describe 'validations' do
    it { should validate_presence_of(:doc_attachment_type_id) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:content_date) }
    it { should validate_presence_of(:language_id) }
    it { should validate_presence_of(:published_date) }
    it { should validate_presence_of(:title) }
  end
  describe 'Saving file' do
    it { should have_attached_file(:attachment) }
  end
  describe 'Rename and save' do
    it 'Has correct extension type ' do
      language = create :language
      document = Document.create(doc_attachment_type_id: 1, code: 'PDF test ', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.pdf"), attachment_file_name: 'Blank.pdf', language_id: language.id, content_date: '2017-07-01', published_date: '2017-07-18')
      expect(document.file_format).to eq('PDF')
    end
    it 'Has correct Original ID ' do
      language = create :language
      document = Document.create(doc_attachment_type_id: 1, code: 'PDF test ', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.pdf"), attachment_file_name: 'Blank.pdf', language_id: language.id, content_date: '2017-07-01', published_date: '2017-07-18')
      expect(document.id).to eq(document.original_id)
    end
  end
  it 'documents search works with a query' do
    document = create :document
    @documents = Document.search(document.title)
    expect(@documents).to include(document)
  end
  it 'documents search is case insensitive' do
    language = create :language
    document = Document.create(doc_attachment_type_id: 1, code: 'case insensitive test 555', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id, content_date: '2017-07-01', published_date: '2017-07-18')
    @documents = Document.search('TEST')
    expect(@documents).to include(document)
  end
  describe 'Can list' do
    it 'unrelated categories' do
      document = create :document
      category = create :category
      document_category = DocumentCategory.create(document: document, category: category)

      category.save!
      document_category.save!

      category2 = create :category
      category2.save!
      expect(document.unrelated_categories.count).to eq(1)
    end
  end
  describe 'Overwrites' do
    it "aren't allowed for new documents" do
      language = create :language
      Document.create(doc_attachment_type_id: 1, code: 'Duplicate this', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id, content_date: '2017-07-01', published_date: '2017-07-18', overwrite_file: false)
      document = Document.create(doc_attachment_type_id: 1, code: 'Duplicate this', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id, content_date: '2017-07-01', published_date: '2017-07-18')
      expect(document.errors.count).to eq 1
    end
  end
end

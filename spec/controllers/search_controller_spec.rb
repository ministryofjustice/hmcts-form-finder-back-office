require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'INDEX' do
    it 'should return  200 if successful' do
      get :index
      expect(response.status).to eq(200)
    end
  end
  it 'Public search works with a code/title query' do
    document = create :document
    @documents = Document.search(document.title)
    expect(@documents).to include(document)
  end
  it 'Public search is case insensitive' do
    language = create :language
    document = Document.create(doc_attachment_type_id: 1, code: 'case insensitive test 555', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    @documents = Document.search('TEST')
    expect(@documents).to include(document)
  end
  it 'Public search works a category' do
    language = create :language
    category1 = create :category
    category2 = Category.create(english_name: 'Case SEnsitive test', welsh_name: 'David')
    document1 = Document.create(doc_attachment_type_id: 1, code: 'case insensitive test 555', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    document2 = Document.create(doc_attachment_type_id: 2, code: 'case insensitive test2 222', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    @documentcategory = DocumentCategory.new
    @documentcategory.category_id = category1.id
    @documentcategory.document_id = document1.id
    @documentcategory.save
    @documentcategory2 = DocumentCategory.new
    @documentcategory2.category_id = category2.id
    @documentcategory2.document_id = document2.id
    @documentcategory2.save
    @documents = Document.searchdocument(category2.id)
    expect(@documents).to include(document2)
  end
  it 'Public search works with both params' do
    language = create :language
    category1 = create :category
    category2 = Category.create(english_name: 'Case SEnsitive test', welsh_name: 'David')
    document1 = Document.create(doc_attachment_type_id: 1, code: 'case insensitive test 555', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    document2 = Document.create(doc_attachment_type_id: 2, code: 'case insensitive test2 222', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    @documentcategory = DocumentCategory.new
    @documentcategory.category_id = category1.id
    @documentcategory.document_id = document1.id
    @documentcategory.save
    @documentcategory2 = DocumentCategory.new
    @documentcategory2.category_id = category2.id
    @documentcategory2.document_id = document2.id
    @documentcategory2.save
    @documents = Document.searchdocs(category2.id, document1.title)
    expect(@documents).to include(document2)
  end
  it 'category search works with query returns empty result' do
    language = create :language
    category1 = create :category
    category2 = Category.create(english_name: 'Case SEnsitive test', welsh_name: 'David')
    category3 = Category.create(english_name: 'null result', welsh_name: 'null result')
    document1 = Document.create(doc_attachment_type_id: 1, code: 'case insensitive test 555', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    document2 = Document.create(doc_attachment_type_id: 2, code: 'case insensitive test2 222', title: 'DOC', attachment: File.new("#{Rails.root}/spec/support/fixtures/Blank.docx"), attachment_file_name: 'Bob', language_id: language.id)
    @documentcategory = DocumentCategory.new
    @documentcategory.category_id = category1.id
    @documentcategory.document_id = document1.id
    @documentcategory.save
    @documentcategory2 = DocumentCategory.new
    @documentcategory2.category_id = category2.id
    @documentcategory2.document_id = document2.id
    @documentcategory2.save
    @documents = Document.searchdocument(category3.id)
    expect(@documents).to be_empty
  end
end


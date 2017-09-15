# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
require 'byebug'

# categories table
csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  t = Category.new
  t.id = row['id']
  t.english_name = row['english_name']
  t.welsh_name = row['welsh_name']
  t.save
end

puts "There are now #{Category.count} rows in the categories table"

# doc_attachment_types table
csv_text = File.read(Rails.root.join('lib', 'seeds', 'doc_attachment_types.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  t = DocAttachmentType.new
  t.id = row['id']
  t.english_name = row['english_name']
  t.welsh_name = row['welsh_name']
  t.save
end

puts "There are now #{DocAttachmentType.count} rows in the Document Attachment Types table"

# languages table
csv_text = File.read(Rails.root.join('lib', 'seeds', 'languages.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  t = Language.new
  t.id = row['id']
  t.english_name = row['english_name']
  t.welsh_name = row['welsh_name']
  t.code = row['code']
  t.save
end

puts "There are now #{Language.count} rows in the languages table"

# documents table
csv_text = File.read(Rails.root.join('lib', 'seeds', 'documents.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  t = Document.new
  t.code = row['code']
  t.title = row['title']
  t.attachment_file_name = row['attachment_file_name']
  t.attachment_content_type = row['attachment_content_type']
  t.attachment_file_size = row['attachment_file_size']
  t.content_date = row['content_date']
  t.language_id = row['language_id']
  t.doc_attachment_type_id = row['doc_attachment_type_id']
  t.inactive = row['inactive']
  t.creator_id = row['creator_id']
  t.original_url = row['original_url']
  t.original_id = row['original_id']
  t.published_date = row['published_date']
  t.file_format = row['file_format']
  t.save
end

puts "There are now #{Document.count} rows in the Documents table"

# document_categories table
csv_text = File.read(Rails.root.join('lib', 'seeds', 'document_categories.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  t = DocumentCategory.new
  t.id = row['id']
  t.document_id = row['document_id']
  t.category_id = row['category_id']
  t.sort_order = row['sort_order']
  t.save
end

puts "There are now #{DocumentCategory.count} rows in the Document_categories table"

# related_document table
csv_text = File.read(Rails.root.join('lib', 'seeds', 'related_document.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  t = Document.new
  y = Document.new
  t.id = row['document_id']
  parent_doc = Document.find(t.id)
  y.id = row['linked_document_id']
  related_doc = Document.find(y.id)
  parent_doc.related_documents << related_doc
end

puts 'There are now records in related_documents table'

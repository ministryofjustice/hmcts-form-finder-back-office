# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
require 'byebug'

#Categories
csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Category.new
  t.id = row['id']
  t.english_name = row['english_name']
  t.welsh_name = row['welsh_name']
  t.save
end

puts "There are now #{Category.count} rows in the categories table"

#DocumentAttachmentType
csv_text = File.read(Rails.root.join('lib', 'seeds', 'doc_attachment_types.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = DocAttachmentType.new
  t.id = row[0]
  t.english_name = row[1]
  t.welsh_name = row[2]
  t.save
end

puts "There are now #{DocAttachmentType.count} rows in the Document Attachment Types table"

#Languages
csv_text = File.read(Rails.root.join('lib', 'seeds', 'languages.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Language.new
  t.id = row['id']
  t.english_name = row['english_name']
  t.welsh_name = row['welsh_name']
  t.code = row['code']
  t.save
end

puts "There are now #{Language.count} rows in the languages table"

# #Court forms
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'e_court_forms_cleaned.csv'))
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#
#   if File.file?(File.join(Rails.root, 'lib', 'existing_forms', row['court_forms_url']))
#     t = Document.new
#     t.original_id = row['court_forms_id']
#     t.code = row['court_forms_num']
#     t.title = row['court_forms_title']
#     #t.court_forms_type = row['court_forms_type']
#     #t.court_forms_comments = row['court_forms_comments']
#     #t.court_forms_category = row['court_forms_category']
#     #t.court_forms_downloadable = row['court_forms_downloadable']
#     #t.court_forms_internal_flag = row['court_forms_internal_flag']
#     t.attachment =  File.open(File.join(Rails.root, 'lib', 'existing_forms', row['court_forms_url']))
#     t.attachment_updated_at = row['court_forms_lastupdate']
#     t.language_id = row['language_id']
#     t.doc_attachment_type_id = 1
#     t.save
#   else
#     puts "#{row['court_forms_num']} - #{row['court_forms_title']} not imported"
#   end
#
# end

# #Court leaflets
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'e_court_leaflets_cleaned.csv'))
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#
#   if File.file?(File.join(Rails.root, 'lib', 'existing_forms', row['court_leaflets_url']))
#     t = Document.new
#     t.original_id = row['court_leaflets_id']
#     t.code = row['court_leaflets_num']
#     t.title = row['court_leaflets_title']
#     #t.court_leaflets_type = row['court_leaflets_type']
#     #t.court_leaflets_comments = row['court_leaflets_comments']
#     #t.court_leaflets_category = row['court_leaflets_category']
#     #t.court_leaflets_downloadable = row['court_leaflets_downloadable']
#     #t.court_leaflets_internal_flag = row['court_leaflets_internal_flag']
#     t.attachment =  File.open(File.join(Rails.root, 'lib', 'existing_forms', row['court_leaflets_url']))
#     t.attachment_updated_at = row['court_leaflets_lastupdate']
#     t.language_id = row['language_id']
#     t.doc_attachment_type_id = 2
#     t.save
#   else
#     puts "#{row['court_leaflets_num']} - #{row['court_leaflets_title']} not imported"
#   end
#
# end

# puts "There are now #{Document.count} rows in the Document Attachment table"
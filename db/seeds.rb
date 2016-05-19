# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
require 'byebug'

#DocumentAttachmentType
csv_text = File.read(Rails.root.join('lib', 'seeds', 'doc_attachment_types.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = DocAttachmentType.new
  t.id = row[0]
  t.name = row[1]
  t.save
end

puts "There are now #{DocAttachmentType.count} rows in the Document Attachment Types table"

#Languages
csv_text = File.read(Rails.root.join('lib', 'seeds', 'e_languages.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Language.new
  t.id = row['language_id']
  t.old_language_id = row[0]
  t.name = row['language_desc']
  t.save
end

puts "There are now #{Language.count} rows in the languages table"

#Court forms
csv_text = File.read(Rails.root.join('lib', 'seeds', 'e_court_forms_cleaned.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|

  if File.file?(File.join(Rails.root, 'lib', 'existing_forms', row['court_forms_url']))
    t = DocAttachment.new
    t.id = row['court_forms_id']
    t.code = row['court_forms_num']
    t.title = row['court_forms_title']
    #t.court_forms_type = row['court_forms_type']
    #t.court_forms_comments = row['court_forms_comments']
    #t.court_forms_category = row['court_forms_category']
    #t.court_forms_downloadable = row['court_forms_downloadable']
    #t.court_forms_internal_flag = row['court_forms_internal_flag']
    t.attachment =  File.open(File.join(Rails.root, 'lib', 'existing_forms', row['court_forms_url']))
    t.attachment_updated_at = row['court_forms_lastupdate']
    t.language_id = row['language_id']
    t.doc_attachment_type_id = 1

    t.save
  else
    puts "#{row['court_froms_num']} - #{row['court_forms_title']} not imported"
  end

end

puts "There are now #{DocAttachment.count} rows in the Document Attachment table"
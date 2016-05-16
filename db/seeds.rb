# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

#DocumentAttachmentType
csv_text = File.read(Rails.root.join('lib', 'seeds', 'document_attachment_types.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = DocumentAttachmentType.new
  t.id = row[0]
  t.name = row[1]
  t.save
end

puts "There are now #{DocumentAttachmentType.count} rows in the Document Attachment Types table"
# == Schema Information
#
# Table name: doc_attachment_types
#
#  id           :integer          not null, primary key
#  english_name :string
#  welsh_name   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe DocAttachmentType, type: :model do
  it 'has a valid factory' do
    expect(DocAttachmentType.create(english_name: 'George', welsh_name: 'David')).to be_valid
  end
  it 'can have an English name if there is no Welsh name' do
    expect(DocAttachmentType.create(english_name: 'George')).to be_valid
  end
  it 'can have an Welsh name if there is no Welsh name' do
    expect(DocAttachmentType.create(welsh_name: 'David')).to be_valid
  end
  it 'must have a name' do
    expect(DocAttachmentType.create).to_not be_valid
  end
  it 'Can be deactivated if no documents belong to it' do
    doc_attachment_type = create :doc_attachment_type
    doc_attachment_type.save!

    doc_attachment_type.inactive = true
    doc_attachment_type.save!

    expect(doc_attachment_type.save).to be_truthy
  end
  it 'Cannot deactivate a Type if a document belongs to it' do
    document = create :document
    doc_attachment_type = create :doc_attachment_type

    document.doc_attachment_type = doc_attachment_type
    document.overwrite_file = true # Need to do document.save for doc_attachment_type test to work
    document.save!
    doc_attachment_type.save!

    doc_attachment_type.inactive = true

    expect(doc_attachment_type.save).to be_falsey
  end
end

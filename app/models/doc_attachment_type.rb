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

require 'validators'

class DocAttachmentType < ActiveRecord::Base

  extend  SoftDeletion::Collection
  include SoftDeletion::Record
  include Validators::ValueCheck

  has_paper_trail

  validates :english_name, presence: true, unless: :welsh_name
  validate :a_name?
  validate :only_inactive_if_not_used

  def the_collection
    Document
  end

  def the_attribute
    :doc_attachment_type_id
  end

end

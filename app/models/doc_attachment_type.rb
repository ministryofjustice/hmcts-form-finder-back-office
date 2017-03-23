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

  include Validators::ValueCheck

  has_paper_trail

  validates :english_name, presence: true, unless: :welsh_name
  validate :has_a_name
  validate :only_inactive_if_unreferenced

  def only_inactive_if_unreferenced
    if inactive && Document.where(:doc_attachment_type_id => id).count > 0
      errors[:base] << "Can't make a Type inactive when it is still in use. Please remove all the documents from the type."
    end
  end
end

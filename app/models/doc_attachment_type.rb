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

class DocAttachmentType < ActiveRecord::Base
  has_paper_trail
  validates :english_name, presence: true, unless: :welsh_name
  validates :welsh_name, presence: true, unless: :english_name
end

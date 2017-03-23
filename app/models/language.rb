# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  english_name :string
#  welsh_name   :string
#  code         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'validators'

class Language < ActiveRecord::Base

  extend  SoftDeletion::Collection
  include SoftDeletion::Record
  include Validators::ValueCheck

  has_paper_trail

  validates :english_name, presence: true, unless: :welsh_name
  validates :code, presence:true
  validate :has_a_name
  validate :only_inactive_if_unreferenced

  def only_inactive_if_unreferenced
    if inactive && Document.where(:language_id => id).count > 0
      errors[:base] << "Can't make a Language inactive when it is still in use. Please remove all the documents from the language."
    end
  end
end

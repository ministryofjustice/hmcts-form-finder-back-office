# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  english_name :string
#  welsh_name   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'validators'

class Category < ActiveRecord::Base

  extend  SoftDeletion::Collection
  include SoftDeletion::Record
  include Validators::ValueCheck

  has_paper_trail
  has_many :documents, through: :document_categories

  validates :english_name, presence: true, unless: :welsh_name
  validate :a_name?
  validate :only_inactive_if_not_used

  def the_collection
    DocumentCategory
  end

  def the_attribute
    :category_id
  end

  def self.search(search)
    where('lower(english_name) LIKE ? or lower(welsh_name) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
  end

end

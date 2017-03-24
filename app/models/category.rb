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
  has_many :documents, :through => :document_categories

  validates :english_name, presence: true, unless: :welsh_name
  validate :has_a_name
  validate :only_inactive_if_not_used

  def self.search(search)
    where("lower(english_name) LIKE ? or lower(welsh_name) LIKE ?", "%#{search.downcase}%","%#{search.downcase}%")
  end

end

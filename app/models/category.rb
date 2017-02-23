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

class Category < ActiveRecord::Base
  has_paper_trail
  has_many :documents, :through => :document_categories
  validates :english_name, presence: true, unless: :welsh_name
  validates :welsh_name, presence: true, unless: :english_name


  def self.search(search)
    where("english_name LIKE ?", "%#{search}%")
    where("welsh_name LIKE ?", "%#{search}%")
  end
end

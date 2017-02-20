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

  extend  SoftDeletion::Collection
  include SoftDeletion::Record

  has_paper_trail

  validates :english_name, presence: true, unless: :welsh_name
  validates :welsh_name, presence: true, unless: :english_name
end

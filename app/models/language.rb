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

class Language < ActiveRecord::Base

  extend  SoftDeletion::Collection
  include SoftDeletion::Record

  has_paper_trail

  validate :has_a_name

  private
  def has_a_name
    if english_name.empty? && welsh_name.empty?
      errors[:base] << "A language must have a name"
    end
  end
end

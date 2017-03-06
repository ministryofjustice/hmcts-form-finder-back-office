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
  include Validators::

  has_paper_trail
  validates :english_name, presence: true, unless: :welsh_name
  validates :code, presence:true
  validate :has_a_name

  private
  def has_a_name
    if nil_or_empty(english_name) && nil_or_empty(welsh_name)
      errors[:base] << "A language must have a name"
    end
  end
  def nil_or_empty(x)
    if x.nil?
      true
    elsif x.empty?
      true
    else
      false
    end
  end
end

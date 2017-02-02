class Language < ActiveRecord::Base
  has_paper_trail
  validates :english_name, presence: true, unless: :welsh_name
end

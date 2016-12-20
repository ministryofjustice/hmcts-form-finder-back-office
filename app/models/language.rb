class Language < ActiveRecord::Base
  has_many :documents
  validates :english_name, presence: true, unless: :welsh_name
  validates :welsh_name, presence: true, unless: :english_name
  validates :code, presence: true
  # validates :name, presence: true, uniqueness: { case_sensitive: false }
end

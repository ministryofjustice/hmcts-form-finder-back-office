class Language < ActiveRecord::Base
  validates :english_name, presence: true, unless: :welsh_name
end

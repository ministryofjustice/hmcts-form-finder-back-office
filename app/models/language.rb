class Language < ActiveRecord::Base
  has_many :doc_attachments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

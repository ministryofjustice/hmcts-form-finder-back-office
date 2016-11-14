class DocAttachmentType < ActiveRecord::Base
  has_many :documents

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

class DocumentCategory < ActiveRecord::Base
  validates :document_id, presence: true
  belongs_to :document
  belongs_to :category
end

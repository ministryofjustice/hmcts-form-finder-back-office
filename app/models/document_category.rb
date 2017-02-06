class DocumentCategory < ActiveRecord::Base
  has_paper_trail
  validates :document_id, presence: true
  belongs_to :document
  belongs_to :category
end

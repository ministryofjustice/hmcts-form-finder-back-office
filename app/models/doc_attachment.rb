class DocAttachment < ActiveRecord::Base
  belongs_to :doc_attachment_type

  has_attached_file :attachment

  validates_attachment_content_type :attachment, content_type: /\Aimage/
end

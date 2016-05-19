class DocAttachment < ActiveRecord::Base
  belongs_to :doc_attachment_type

  has_attached_file :attachment

  acts_as_gov_uk_date :published_date

  validates_attachment_presence :attachment
  validates_attachment_content_type :attachment,
                                    content_type: %w(application/pdf application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document text/plain),
                                    size: { :in => 0..10.megabytes }

  validates :doc_attachment_type_id, presence: true
  validates :code, presence: true
  validates :title, presence: true
end

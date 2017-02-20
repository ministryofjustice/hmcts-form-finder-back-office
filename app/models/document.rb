# == Schema Information
#
# Table name: documents
#
#  id                      :integer          not null, primary key
#  code                    :string
#  title                   :string
#  category                :string
#  doc_attachment_type_id  :integer          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  published_date          :date
#  language_id             :integer
#  original_id             :integer
#  creator_id              :integer
#

class Document < ActiveRecord::Base

  extend  SoftDeletion::Collection
  include SoftDeletion::Record

  has_paper_trail

  belongs_to :doc_attachment_type
  belongs_to :language
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'

  has_and_belongs_to_many :related_documents,
                          class_name: "Document",
                          join_table: :related_documents,
                          foreign_key: :document_id,
                          association_foreign_key: :linked_document_id,
                          uniq: true

  acts_as_gov_uk_date :published_date

  has_attached_file :attachment

  before_save :rename_file

  validates_attachment_presence :attachment

  validates_attachment_content_type :attachment,
                                    content_type: %w(application/pdf application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document text/plain),
                                    size: { :in => 0..10.megabytes }

  validates :doc_attachment_type_id, presence: true
  validates :code, presence: true
  validates :title, presence: true
  validates :language_id, presence: true

  def rename_file
    extension = File.extname(attachment_file_name).gsub(/^\.+/, '')
    attachment.instance_write(attachment_file_name.gsub(/\.#{extension}$/, ''),
                              "#{self.code}-#{self.language.english_name}.#{extension}")
  end
  def all_related
    Document.where("id IN (SELECT DISTINCT documents.id FROM documents, related_documents
    WHERE documents.id = related_documents.linked_document_id
    AND  related_documents.document_id =  #{self.id}
      UNION
    SELECT DISTINCT documents.id FROM documents, related_documents
    WHERE documents.id = related_documents.document_id
    AND  related_documents.linked_document_id =  #{self.id})")
  end
  def self.search(search)
    where("code LIKE ?", "%#{search}%")
    where("title LIKE ?", "%#{search}%")
  end
end

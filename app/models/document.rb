# == Schema Information
#
# Table name: documents
#
#  id                       :integer    not null, primary key
#  code                     :string
#  title                    :string
#  doc_attachment_type_id   :integer    not null
#  created_at               :datetime   not null
#  updated_at               :datetime   not null
#  attachment_file_name     :string
#  attachment_content_type  :string
#  attachment_file_size     :integer
#  attachment_updated_at    :datetime
#  published_date           :date
#  language_id              :integer
#  original_id              :integer
#  creator_id               :integer
#  original_url             :string
#  file_format              :string
#  summary                  :string(140)
#

class Document < ActiveRecord::Base

  extend  SoftDeletion::Collection
  include SoftDeletion::Record

  has_paper_trail

  belongs_to :doc_attachment_type
  belongs_to :language
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :document_categories
  has_many :categories, through: :document_categories

  has_and_belongs_to_many :related_documents,
                          class_name: 'Document',
                          join_table: :related_documents,
                          foreign_key: :document_id,
                          association_foreign_key: :linked_document_id,
                          uniq: true

  acts_as_gov_uk_date :published_date

  has_attached_file :attachment

  before_save :format_filename_and_type

  validates_attachment_presence :attachment

  validates_attachment_content_type :attachment,
                                    content_type: %w(application/zip application/pdf application/msword application/excel application/vnd.ms-excel application/vnd.oasis.opendocument.text application/vnd.oasis.opendocument.spreadsheet application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.openxmlformats-officedocument.wordprocessingml.document),
                                    size: { in: 0..10.megabytes }

  validates :doc_attachment_type_id, presence: true
  validates :code, presence: true
  validates :title, presence: true
  validates :language_id, presence: true


  validates_length_of :summary, maximum: 250

  after_create :populate_original_id

  def active
    Document.where('inactive = ?', 'False')
  end

  scope :leaflets, -> { where('doc_attachment_type_id != ?', '1') }
  scope :forms, -> { where(doc_attachment_type_id: '1') }
  scope :document, -> { where(doc_attachment_type_id: '1') }
  scope :language_english, -> { where(language_id: '8') }
  scope :language_bilingual, -> { where(language_id: '26') }
  scope :language_welsh, -> { where(language_id: '25') }
  scope :language_other, -> { where.not(language_id: [8, 25]) }
  # TODO: Refactor non-human-readable where clause

  def format_filename_and_type
    # Get the file extension minus the leading '.'
    extension = File.extname(attachment_file_name).gsub(/^\.+/, '').upcase!
    # Build new filename in [reference]-[language].[extension] format.
    filename = ("#{code.gsub(/\s+/, '-')}-#{language.code}.#{extension}").downcase!
    # Set DB file_format value
    self.file_format = extension
    # Write the file
    attachment.instance_write(:file_name, filename)
  end

  def all_related
    Document.where("id IN (SELECT DISTINCT documents.id FROM documents, related_documents
    WHERE documents.id = related_documents.linked_document_id
    AND  related_documents.document_id =  #{id}
      UNION
    SELECT DISTINCT documents.id FROM documents, related_documents
    WHERE documents.id = related_documents.document_id
    AND  related_documents.linked_document_id =  #{id})")
  end

  def all_unrelated
    Document.where("id <> #{id} and id not IN (SELECT DISTINCT documents.id FROM documents, related_documents
    WHERE documents.id = related_documents.linked_document_id
    AND  related_documents.document_id =  #{id}
      UNION
    SELECT DISTINCT documents.id FROM documents, related_documents
    WHERE documents.id = related_documents.document_id
    AND  related_documents.linked_document_id =  #{id}) ")
  end

  def unrelated_categories
    Category.where("id NOT IN (SELECT DISTINCT categories.id FROM categories, document_categories
    WHERE categories.id = document_categories.category_id
    AND document_categories.document_id = #{id})")
  end

  def reference_with_attributes
    "#{code} (#{language.english_name} #{file_format})"
  end

  def self.search(search)
    where('lower(code) LIKE ? or lower(title) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
  end

  def self.searchcategory(search)
    where('lower(code) LIKE ? or lower(title) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
  end

  def self.searchdocument(search)
    document_ids = DocumentCategory.where('category_id = ? ', search).pluck(:document_id)
    Document.where(id: document_ids)
  end

  def self.searchdocs(search, searchcode)
    document_ids = DocumentCategory.where('category_id = ?', search).pluck(:document_id)
    ids = Document.where('lower(code) LIKE ? or lower(title) LIKE ?', "%#{searchcode.downcase}%", "%#{searchcode.downcase}%").pluck(:id)
    document_ids = document_ids + ids
    Document.where(id: document_ids)
  end

  def populate_original_id
    self.original_id = id
    save
  end
end

class Document < ActiveRecord::Base
  belongs_to :doc_attachment_type
  belongs_to :language
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'

  #scope :created_by_user, lambda { |user| where( :creator_id => user.id ) }

  has_and_belongs_to_many :related_documents

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
end

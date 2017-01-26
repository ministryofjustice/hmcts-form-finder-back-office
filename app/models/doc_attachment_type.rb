class DocAttachmentType < ActiveRecord::Base
  validates :english_name, presence: true, unless: :welsh_name
  validates :welsh_name, presence: true, unless: :english_name
end

# == Schema Information
#
# Table name: document_categories
#
#  id          :integer          not null, primary key
#  document_id :integer
#  category_id :integer
#  sort_order  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DocumentCategory < ActiveRecord::Base
  has_paper_trail
  validates :document_id, presence: true
  belongs_to :document
  belongs_to :category

  def all_related
    DocumentCategory.where("document_categories.document_id =  #{id}")
  end
end

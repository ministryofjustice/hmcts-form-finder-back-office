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

require 'rails_helper'

RSpec.describe DocumentCategory, type: :model do

  it 'has a valid factory' do
    expect(create(:document_category)).to be_valid
  end

  it { should belong_to(:document)}
  it { should belong_to(:category)}

  it "Cannot inactivate a Category if a document belongs to it" do

    document = create :document
    category = create :category
    document_category = create :document_category
    document_category.document = document
    document_category.category = category

    document.save!
    category.save!
    document_category.save!

    category.inactive = true

    expect(category.save).to be_falsey

  end

end

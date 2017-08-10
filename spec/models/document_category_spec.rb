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

  it { should belong_to(:document) }
  it { should belong_to(:category) }

  it 'Can be deactivated if no documents belong to it' do
    category = create :category
    category.save!
    category.inactive = true
    expect(category.save).to be_truthy
  end
  it 'Cannot inactivate a Category if a document belongs to it' do
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
  it 'Can assign a document to a category' do
    document = create :document
    category = create :category
    document_category = create :document_category
    document_category.document = document
    document_category.category = category

    document.save!
    category.save!
    expect(document_category.save).to be_truthy
  end
  it 'Can return linked categories' do
    document = create :document
    category = create :category
    document_category = create :document_category
    document_category.document = document
    document_category.category = category

    document.save!
    category.save!
    document_category.save!

    category2 = create :category
    document_category2 = create :document_category
    document_category2.document = document
    document_category2.category = category2
    document_category2.save!

    expect(document.categories.count).to eq(2)
  end
end

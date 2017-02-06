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

#  let(:document) create(:document, valid_attributes)

  it 'has a valid factory' do
    expect(create(:document_category)).to be_valid
  end

  it { should belong_to(:document)}
  it { should belong_to(:category)}

end

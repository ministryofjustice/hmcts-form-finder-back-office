require 'rails_helper'

RSpec.describe DocumentCategory, type: :model do

#  let(:document) create(:document, valid_attributes)

  it 'has a valid factory' do
    expect(create(:document_category)).to be_valid
  end

  it { should belong_to(:document)}
  it { should belong_to(:category)}

end

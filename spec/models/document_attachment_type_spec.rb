require 'rails_helper'

RSpec.describe DocumentAttachmentType, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:document_attachment_type)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    #it { should validate_uniqueness_of(:name)}
  end

  #it { should validate_presence_of(:court_leaflets_category) }
  #it { should validate_presence_of(:court_leaflets_download) }
  #it { should validate_presence_of(:court_leaflets_url) }
  #it { should validate_presence_of(:court_leaflets_format) }
  #it { should validate_presence_of(:language_id) }

  #it { should belong_to(:language) }

  #it 'is invalid without a work type id or description' do
    #expect(CourtWorkType.new(description: nil)).to be_invalid
  #end

end

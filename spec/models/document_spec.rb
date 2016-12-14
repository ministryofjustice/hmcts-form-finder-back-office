require 'rails_helper'

RSpec.describe Document, type: :model do

  it { should belong_to(:creator)}
  it { should belong_to(:doc_attachment_type) }
  it { should belong_to(:language) }

  describe 'validations' do
    it { should validate_presence_of(:doc_attachment_type_id)}
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:language_id) }

  end
  describe 'Saving file' do
    it {should have_attached_file(:attachment)}
  end

end
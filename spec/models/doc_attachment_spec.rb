require 'rails_helper'

RSpec.describe DocAttachment, type: :model do

  it { should belong_to(:doc_attachment_type) }

  describe 'validations' do
    it { should validate_presence_of(:doc_attachment_type_id)}
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:title) }

  end
end

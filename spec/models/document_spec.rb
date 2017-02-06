# == Schema Information
#
# Table name: documents
#
#  id                      :integer          not null, primary key
#  code                    :string
#  title                   :string
#  category                :string
#  doc_attachment_type_id  :integer          not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  published_date          :date
#  language_id             :integer
#  original_id             :integer
#  creator_id              :integer
#

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

# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  english_name :string
#  welsh_name   :string
#  code         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Language, type: :model do
  it 'has a valid factory' do
    expect(Language.create(english_name: 'George', welsh_name: 'David', code: 'EX10') ).to be_valid
  end
  it 'can have an English name if there is no Welsh name' do
    expect(Language.create(english_name: 'George', code: 'EX10') ).to be_valid
  end
  it 'can have a Welsh name if there is no English name' do
    expect(Language.create(welsh_name: 'David', code: 'EX10') ).to be_valid
  end
  it 'must have a name' do
    expect(Language.create ).to_not be_valid
  end
  it 'must have a code' do
    expect(Language.create(english_name: 'George', welsh_name: 'David')).to_not be_valid
  end
  it 'Can be deactivated if no documents belong to it' do
    language = create :language
    language.save!

    language.inactive = true
    language.save!

    expect(language.save).to be_truthy
  end
  it 'Cannot deactivate a Language if a document belongs to it' do
    document = create :document
    language = create :language

    document.language = language

    document.save!
    language.save!

    language.inactive = true

    expect(language.save).to be_falsey
  end
end

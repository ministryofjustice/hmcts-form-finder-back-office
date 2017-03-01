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
  it "has a valid factory" do
    expect(Language.create(english_name: "George", welsh_name: "David", code: "EX10") ).to be_valid
  end
  it "can have an English name if there is no Welsh name" do
    expect(Language.create(english_name: "George", code: "EX10") ).to be_valid
  end
  it "can have an Welsh name if there is no English name" do
    expect(Language.create(welsh_name: "David", code: "EX10") ).to be_valid
  end
  it "must have an English name if there is no Welsh name" do
    expect(Language.create ).to_not be_valid
  end
  it "must have an Welsh name if there is no English name" do
    expect(Language.create ).to_not be_valid
  end
end

# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  english_name :string
#  welsh_name   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    expect(Category.create(english_name: "George", welsh_name: "David") ).to be_valid
  end
  it "can have an English name if there is no Welsh name" do
    expect(Category.create(english_name: "George") ).to be_valid
  end
  it "can have an Welsh name if there is no Welsh name" do
    expect(Category.create(welsh_name: "David") ).to be_valid
  end
  it "must have an English name if there is no Welsh name" do
    expect(Category.create ).to_not be_valid
  end
  it "must have an Welsh name if there is no English name" do
    expect(Category.create ).to_not be_valid
  end
end

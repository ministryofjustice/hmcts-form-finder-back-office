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
  it "can have a Welsh name if there is no Welsh name" do
    expect(Category.create(welsh_name: "David") ).to be_valid
  end
  it "must have a name" do
    expect(Category.create ).to_not be_valid
  end
  it "categories search works with a query" do
    category = create :category
    @categories = Category.search(category.english_name)
    @categories.should include(category)
  end
  it "categories search is case insensitive" do
    category=Category.create(english_name: "Case SEnsitive test", welsh_name: "David")
    @categories = Category.search('CASE seNSITIVE')
    @categories.should include(category)
  end
end

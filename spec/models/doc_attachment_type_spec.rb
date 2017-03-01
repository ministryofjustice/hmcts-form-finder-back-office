require 'rails_helper'

RSpec.describe DocAttachmentType, type: :model do
  it "has a valid factory" do
    expect(DocAttachmentType.create(english_name: "George", welsh_name: "David") ).to be_valid
  end
  it "can have an English name if there is no Welsh name" do
    expect(DocAttachmentType.create(english_name: "George") ).to be_valid
  end
  it "can have an Welsh name if there is no Welsh name" do
    expect(DocAttachmentType.create(welsh_name: "David") ).to be_valid
  end
  it "must have an English name if there is no Welsh name" do
    expect(DocAttachmentType.create ).to_not be_valid
  end
  it "must have an Welsh name if there is no English name" do
    expect(DocAttachmentType.create ).to_not be_valid
  end
end

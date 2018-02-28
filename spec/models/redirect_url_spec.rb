require 'rails_helper'

RSpec.describe RedirectUrl, type: :model do
  it 'has a valid factory' do
    expect(RedirectUrl.create(incoming: 'oldschool', outgoing: 'govuk')).to be_valid
  end
  it 'can have an incoming url if there is no outgoing url (needed for setup scenario)' do
    expect(RedirectUrl.create(incoming: 'oldschool')).to be_valid
  end
  it 'cannot have a outgoing url if there is no incoming url' do
    expect(RedirectUrl.create(outgoing: 'govuk')).to_not be_valid
  end
  it 'must have an incoming url' do
    expect(RedirectUrl.create).to_not be_valid
  end
end

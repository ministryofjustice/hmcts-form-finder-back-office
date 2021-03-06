# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end

  it { should have_many(:documents) }

  it 'has a strong password' do
    user = build(:user, password: 'lowercase only', password_confirmation: 'lowercase only')
    expect(user.valid?).to be_falsey
    user.password, user.password_confirmation = 'lowercaseUPPERCASE'
    expect(user.valid?).to be_falsey
    user.password, user.password_confirmation = 'lowerUPPERnumeric12345'
    expect(user.valid?).to be_falsey
    user.password, user.password_confirmation = 'Az!4567'
    expect(user.valid?).to be_falsey
    user.password, user.password_confirmation = 'Az!45678'
    expect(user.valid?).to be_truthy
  end
end

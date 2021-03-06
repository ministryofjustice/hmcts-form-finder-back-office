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

class User < ActiveRecord::Base
  extend  SoftDeletion::Collection
  include SoftDeletion::Record

  has_many :documents, foreign_key: 'creator_id'
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :trackable, :validatable, :timeoutable

  validate :password_complexity, unless: :persisted?

  def password_complexity
    return unless password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/)
    errors.add :password, 'must include at least one lowercase letter, one uppercase letter, and one digit, and one of !@#$%&*'
  end

  def active_for_authentication?
    super && inactive == false
  end

  def inactive_message
    'User account has been disabled'
  end

  def full_name
    first_name + ' ' + last_name
  end
end

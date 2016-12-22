class User < ActiveRecord::Base

  has_many :documents, foreign_key: 'creator_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :trackable, :validatable
end

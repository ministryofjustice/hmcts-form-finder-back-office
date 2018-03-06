class RedirectUrl < ApplicationRecord
  extend  SoftDeletion::Collection
  include SoftDeletion::Record
  validates :incoming, presence: true, if: ':outgoing.present?'
end

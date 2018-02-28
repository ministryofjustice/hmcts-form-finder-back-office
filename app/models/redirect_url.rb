class RedirectUrl < ApplicationRecord
  validates :incoming, presence: true, if: ':outgoing.present?'
end

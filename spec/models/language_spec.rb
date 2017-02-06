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
  pending "add some examples to (or delete) #{__FILE__}"
end

require 'rails_helper'

RSpec.describe DocAttachment, type: :model do

  it { should belong_to(:doc_attachment_type) }

end

require 'rails_helper'

RSpec.describe 'DocAttachmentTypes', type: :request do
  describe 'GET /doc_attachment_types' do
    it 'works! (now write some real specs)' do
      get doc_attachment_types_path
      expect(response).to have_http_status(302)
    end
  end
end

require 'rails_helper'

RSpec.describe DocAttachmentTypesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/doc_attachment_types').to route_to('doc_attachment_types#index')
    end

    it 'routes to #new' do
      expect(:get => '/doc_attachment_types/new').to route_to('doc_attachment_types#new')
    end

    it 'routes to #show' do
      expect(:get => '/doc_attachment_types/1').to route_to('doc_attachment_types#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/doc_attachment_types/1/edit').to route_to('doc_attachment_types#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/doc_attachment_types').to route_to('doc_attachment_types#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/doc_attachment_types/1').to route_to('doc_attachment_types#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/doc_attachment_types/1').to route_to('doc_attachment_types#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/doc_attachment_types/1').to route_to('doc_attachment_types#destroy', :id => '1')
    end
  end
end

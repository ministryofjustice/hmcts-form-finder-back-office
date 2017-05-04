require 'rails_helper'

RSpec.describe DocumentCategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/document_categories').to route_to('document_categories#index')
    end

    it 'routes to #new' do
      expect(:get => '/document_categories/new').to route_to('document_categories#new')
    end

    it 'routes to #show' do
      expect(:get => '/document_categories/1').to route_to('document_categories#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/document_categories/1/edit').to route_to('document_categories#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/document_categories').to route_to('document_categories#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/document_categories/1').to route_to('document_categories#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/document_categories/1').to route_to('document_categories#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/document_categories/1').to route_to('document_categories#destroy', :id => '1')
    end
  end
end

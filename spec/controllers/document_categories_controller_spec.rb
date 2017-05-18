require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe DocumentCategoriesController, type: :controller do
  context 'Internal User' do
    let(:authorised) { create(:user) }
    let(:document) { create(:document) }
    let(:category) { create(:category) }

    # This should return the minimal set of attributes required to create a valid
    # DocumentCategory. As you add validations to DocumentCategory, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { { document: document, category: category } }

    let(:invalid_attributes) { { document_id: nil, category_id: nil, sort_order: nil } }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # DocumentCategoriesController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe 'GET #index' do
      before { sign_in authorised }
      it 'assigns all document_categories as @document_categories' do
        document_category = DocumentCategory.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:document_categories)).to eq([document_category])
      end
    end

    # describe "GET #show" do
    #   before {
    #     sign_in authorised
    #   }
    #   it "assigns the requested document_category as @document_category" do
    #     document_category = DocumentCategory.create! valid_attributes
    #     get :show, params: {id: document_category.to_param}, session: valid_session
    #     expect(assigns(:document_category)).to eq(document_category)
    #   end
    # end

    describe 'GET #new' do
      before { sign_in authorised }
      it 'assigns a new document_category as @document_category' do
        document_category = DocumentCategory.create! valid_attributes
        get :new, params: { id: document_category.to_param }, session: valid_session
        expect(assigns(:document_category)).to be_a_new(DocumentCategory)
      end
    end

    describe 'GET #edit' do
      before do
        sign_in authorised
      end
      it 'assigns the requested document_category as @document_category' do
        document_category = DocumentCategory.create! valid_attributes
        get :edit, id: document_category.to_param, session: valid_session
        expect(assigns(:document_category)).to eq(document_category)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        before do
          sign_in authorised
        end
        it 'creates a new DocumentCategory' do
          # expect {
          #   post :create, document_category: attributes_for(:document_category), session: valid_session
          # }.to change(DocumentCategory, :count).by(1)
          expect do
            post :create, document_category: FactoryGirl.build(:document_category, document_id: document.id, category_id: category.id).attributes.symbolize_keys, session: valid_session
          end.to change(DocumentCategory, :count).by(1)
        end

        it 'assigns a newly created document_category as @document_category' do
          post :create, document_category: FactoryGirl.build(:document_category, document_id: document.id, category_id: category.id).attributes.symbolize_keys, session: valid_session
          expect(assigns(:document_category)).to be_a(DocumentCategory)
          expect(assigns(:document_category)).to be_persisted
        end

        it 'redirects to the created document_category' do
          post :create, document_category: FactoryGirl.build(:document_category, document_id: document.id, category_id: category.id).attributes.symbolize_keys, session: valid_session
          expect(response).to redirect_to(DocumentCategory.last)
        end
      end

      context 'with invalid params' do
        before do
          sign_in authorised
        end
        it 'assigns a newly created but unsaved document_category as @document_category' do
          post :create, document_category: invalid_attributes, session: valid_session
          expect(assigns(:document_category)).to be_a_new(DocumentCategory)
        end

        before do
          sign_in authorised
        end
        it "re-renders the 'new' template" do
          post :create, document_category: invalid_attributes, session: valid_session
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) { attributes_for(:document_category) }

        before do
          sign_in authorised
        end
        it 'updates the requested document_category' do
          document_category = DocumentCategory.create! valid_attributes
          put :update, { id: document_category.to_param, document_category: invalid_attributes }, session: valid_session
          document_category.reload
          # TO DO Flesh this out
        end

        before do
          sign_in authorised
        end
        it 'assigns the requested document_category as @document_category' do
          document_category = DocumentCategory.create! valid_attributes
          put :update, { id: document_category.to_param, document_category: valid_attributes }, session: valid_session
          expect(assigns(:document_category)).to eq(document_category)
        end

        it 'redirects to the document_category' do
          document_category = DocumentCategory.create! valid_attributes
          put :update, { id: document_category.to_param, document_category: valid_attributes }, session: valid_session
          expect(response).to redirect_to(document_category)
        end
      end

      context 'with invalid params' do
        before do
          sign_in authorised
        end
        it 'assigns the document_category as @document_category' do
          document_category = DocumentCategory.create! valid_attributes
          put :update, { id: document_category.to_param, document_category: invalid_attributes }, session: valid_session
          expect(assigns(:document_category)).to eq(document_category)
        end

        before do
          sign_in authorised
        end
        it "re-renders the 'edit' template" do
          document_category = DocumentCategory.create! valid_attributes
          put :update, { id: document_category.to_param, document_category: invalid_attributes }, session: valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        sign_in authorised
      end
      it 'destroys the requested document_category' do
        document_category = DocumentCategory.create! valid_attributes
        expect do
          delete :destroy, { id: document_category.to_param }, session: valid_session
        end.to change(DocumentCategory, :count).by(-1)
      end

      before do
        sign_in authorised
      end
      it 'redirects to the document_categories list' do
        document_category = DocumentCategory.create! valid_attributes
        delete :destroy, { id: document_category.to_param }, session: valid_session
        expect(response).to redirect_to(document_categories_url)
      end
    end
  end
end

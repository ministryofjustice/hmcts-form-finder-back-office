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

RSpec.describe DocAttachmentTypesController, type: :controller do
  context 'Internal User' do
    let(:authorised) { create(:user) }

    # This should return the minimal set of attributes required to create a valid
    # DocAttachmentType. As you add validations to DocAttachmentType, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { attributes_for(:doc_attachment_type) }

    let(:invalid_attributes) { { english_name: nil, welsh_name: nil } }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # DocAttachmentTypesController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe 'GET #index' do
      before { sign_in authorised }
      it 'assigns all doc_attachment_types as @doc_attachment_types' do
        doc_attachment_type = DocAttachmentType.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:doc_attachment_types)).to eq([doc_attachment_type])
      end
    end

    describe 'GET #show' do
      before { sign_in authorised }
      it 'assigns the requested doc_attachment_type as @doc_attachment_type' do
        doc_attachment_type = DocAttachmentType.create! valid_attributes
        get :show, id: doc_attachment_type.to_param, session: valid_session
        expect(assigns(:doc_attachment_type)).to eq(doc_attachment_type)
      end
    end

    describe 'GET #new' do
      before do
        sign_in authorised
      end
      it 'assigns a new doc_attachment_type as @doc_attachment_type' do
        get :new, params: {}, session: valid_session
        expect(assigns(:doc_attachment_type)).to be_a_new(DocAttachmentType)
      end
    end

    describe 'GET #edit' do
      before do
        sign_in authorised
      end
      it 'assigns the requested doc_attachment_type as @doc_attachment_type' do
        doc_attachment_type = DocAttachmentType.create! valid_attributes
        get :edit, { id: doc_attachment_type.to_param }, session: valid_session
        expect(assigns(:doc_attachment_type)).to eq(doc_attachment_type)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        before do
          sign_in authorised
        end
        it 'creates a new DocAttachmentType' do
          expect do
            post :create, doc_attachment_type: attributes_for(:doc_attachment_type), session: valid_session
          end.to change(DocAttachmentType, :count).by(1)
        end

        it 'assigns a newly created doc_attachment_type as @doc_attachment_type' do
          post :create, doc_attachment_type: valid_attributes, session: valid_session
          expect(assigns(:doc_attachment_type)).to be_a(DocAttachmentType)
          expect(assigns(:doc_attachment_type)).to be_persisted
        end

        it 'redirects to the created doc_attachment_type' do
          post :create, doc_attachment_type: valid_attributes, session: valid_session
          expect(response).to redirect_to(DocAttachmentType.last)
        end
      end

      context 'with invalid params' do
        before do
          sign_in authorised
        end
        it 'assigns a newly created but unsaved doc_attachment_type as @doc_attachment_type' do
          post :create, doc_attachment_type: invalid_attributes, session: valid_session
          expect(assigns(:doc_attachment_type)).to be_a_new(DocAttachmentType)
        end

        it "re-renders the 'new' template" do
          post :create, doc_attachment_type: invalid_attributes, session: valid_session
          get :new
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        before do
          sign_in authorised
        end
        let(:new_attributes) { attributes_for(:doc_attachment_type) }

        it 'updates the requested doc_attachment_type' do
          doc_attachment_type = DocAttachmentType.create! valid_attributes
          put :update, id: doc_attachment_type.to_param, doc_attachment_type: new_attributes, session: valid_session
          doc_attachment_type.reload
          expect(assigns(:doc_attachment_type)).to eq(doc_attachment_type)
        end

        it 'assigns the requested doc_attachment_type as @doc_attachment_type' do
          doc_attachment_type = DocAttachmentType.create! valid_attributes
          put :update, id: doc_attachment_type.to_param, doc_attachment_type: valid_attributes, session: valid_session
          expect(assigns(:doc_attachment_type)).to eq(doc_attachment_type)
        end

        it 'redirects to the doc_attachment_type' do
          doc_attachment_type = DocAttachmentType.create! valid_attributes
          put :update, id: doc_attachment_type.to_param, doc_attachment_type: valid_attributes, session: valid_session
          expect(response).to redirect_to(doc_attachment_type)
        end
      end

      context 'with invalid params' do
        before do
          sign_in authorised
        end
        it 'assigns the doc_attachment_type as @doc_attachment_type' do
          doc_attachment_type = DocAttachmentType.create! valid_attributes
          put :update, id: doc_attachment_type.to_param, doc_attachment_type: invalid_attributes, session: valid_session
          expect(assigns(:doc_attachment_type)).to eq(doc_attachment_type)
        end

        it "re-renders the 'edit' template" do
          doc_attachment_type = DocAttachmentType.create! valid_attributes
          put :update, id: doc_attachment_type.to_param, doc_attachment_type: invalid_attributes, session: valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        sign_in authorised
      end
      it 'destroys the requested doc_attachment_type' do
        doc_attachment_type = DocAttachmentType.create! valid_attributes
        expect do
          delete :destroy, id: doc_attachment_type.to_param, session: valid_session
        end.to change(DocAttachmentType, :count).by(-1)
      end

      it 'redirects to the doc_attachment_types list' do
        doc_attachment_type = DocAttachmentType.create! valid_attributes
        delete :destroy, id: doc_attachment_type.to_param, session: valid_session
        expect(response).to redirect_to(doc_attachment_types_url)
      end
    end
  end
end

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

RSpec.describe RedirectUrlsController, type: :controller do
  context 'Internal User' do
    let(:authorised) { create(:user) }
    # This should return the minimal set of attributes required to create a valid
    # RedirectUrl. As you add validations to RedirectUrl, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { attributes_for(:redirect_url) }

    let(:invalid_attributes) { { incoming: '', outgoing: '', code: '' } }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # RedirectUrlsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe 'GET #index' do
      before { sign_in authorised }
      it 'assigns all redirect_urls as @redirect_urls' do
        redirect_url = RedirectUrl.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(assigns(:active_redirect_urls)).to eq([redirect_url])
      end
    end

    describe 'GET #show' do
      before { sign_in authorised }
      it 'assigns the requested redirect_url as @redirect_url' do
        redirect_url = RedirectUrl.create! valid_attributes
        get :show, params: { id: redirect_url.to_param, session: valid_session }
        expect(assigns(:redirect_url)).to eq(redirect_url)
      end
    end

    describe 'GET #new' do
      before { sign_in authorised }
      it 'assigns a new redirect_url as @redirect_url' do
        get :new, params: {}, session: valid_session
        expect(assigns(:redirect_url)).to be_a_new(RedirectUrl)
      end
    end

    describe 'GET #edit' do
      before { sign_in authorised }
      it 'assigns the requested redirect_url as @redirect_url' do
        redirect_url = RedirectUrl.create! valid_attributes
        get :edit, params: { id: redirect_url.to_param, session: valid_session }
        expect(assigns(:redirect_url)).to eq(redirect_url)
      end
    end

    describe 'POST #create' do
      before { sign_in authorised }
      context 'with valid params' do
        it 'creates a new RedirectUrl' do
          expect do
            post :create, params: { redirect_url: valid_attributes, session: valid_session }
          end.to change(RedirectUrl, :count).by(1)
        end

        it 'assigns a newly created redirect_url as @redirect_url' do
          post :create, params: { redirect_url: valid_attributes, session: valid_session }
          expect(assigns(:redirect_url)).to be_a(RedirectUrl)
          expect(assigns(:redirect_url)).to be_persisted
        end

        it 'redirects to the created redirect_url' do
          post :create, params: { redirect_url: valid_attributes, session: valid_session }
          expect(response).to redirect_to(RedirectUrl.last)
        end
      end

      context 'with invalid params' do
        before do
          sign_in authorised
        end
        it 'assigns a newly created but unsaved redirect_url as @redirect_url' do
          post :create, params: { redirect_url: invalid_attributes, session: valid_session }
          expect(assigns(:redirect_url)).to be_a_new(RedirectUrl)
        end

        it "re-renders the 'new' template" do
          post :create, params: { redirect_url: invalid_attributes, session: valid_session }
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT #update' do
      before { sign_in authorised }
      context 'with valid params' do
        let(:new_attributes) { { incoming: 'old_place', outgoing: 'new_place' } }

        it 'updates the requested redirect_url' do
          redirect_url = RedirectUrl.create! valid_attributes
          put :update, params: { id: redirect_url.to_param, redirect_url: new_attributes, session: valid_session }
          redirect_url.reload
          expect(redirect_url.incoming).to eq('old_place')
        end

        it 'assigns the requested redirect_url as @redirect_url' do
          redirect_url = RedirectUrl.create! valid_attributes
          put :update, params: { id: redirect_url.to_param, redirect_url: valid_attributes, session: valid_session }
          expect(assigns(:redirect_url)).to eq(redirect_url)
        end

        it 'redirects to the redirect_url' do
          redirect_url = RedirectUrl.create! valid_attributes
          put :update, params: { id: redirect_url.to_param, redirect_url: valid_attributes, session: valid_session }
          expect(response).to redirect_to(redirect_url)
        end
      end

      context 'with invalid params' do
        before { sign_in authorised }
        it 'assigns the redirect_url as @redirect_url' do
          redirect_url = RedirectUrl.create! valid_attributes
          put :update, params: { id: redirect_url.to_param, redirect_url: invalid_attributes }, session: { session: valid_session }
          expect(assigns(:redirect_url)).to eq(redirect_url)
        end

        it "re-renders the 'edit' template" do
          redirect_url = RedirectUrl.create! valid_attributes
          put :update, params: { id: redirect_url.to_param, redirect_url: invalid_attributes, session: valid_session }
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE #destroy' do
      before { sign_in authorised }
      it 'destroys the requested redirect_url' do
        redirect_url = RedirectUrl.create! valid_attributes
        expect do
          delete :destroy, params: { id: redirect_url.to_param, session: valid_session }
        end.to change(RedirectUrl, :count).by(-1)
      end

      it 'redirects to the redirect_urls list' do
        redirect_url = RedirectUrl.create! valid_attributes
        delete :destroy, params: { id: redirect_url.to_param, session: valid_session }
        expect(response).to redirect_to(redirect_urls_url)
      end
    end
  end
end

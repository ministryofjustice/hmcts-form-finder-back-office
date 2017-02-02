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

RSpec.describe LanguagesController, type: :controller do
  context "Internal User" do
    let(:authorised) { create(:user) }
  # This should return the minimal set of attributes required to create a valid
  # Language. As you add validations to Language, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:language)
  }

  let(:invalid_attributes) {
    {english_name: nil, welsh_name: nil, code: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LanguagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    before {
      sign_in authorised
    }
    it "assigns all languages as @languages" do
      language = Language.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:languages)).to eq([language])
    end
  end

  describe "GET #show" do
    before {
      sign_in authorised
    }
    it "assigns the requested language as @language" do
      language = Language.create! valid_attributes
      get :show,id: language.to_param, session: valid_session
      expect(assigns(:language)).to eq(language)
    end
  end

  describe "GET #new" do
    before {
      sign_in authorised
    }
    it "assigns a new language as @language" do
      get :new, params: {}, session: valid_session
      expect(assigns(:language)).to be_a_new(Language)
    end
  end

  describe "GET #edit" do
    before {
      sign_in authorised
    }
    it "assigns the requested language as @language" do
      language = Language.create! valid_attributes
      get :edit, id: language.to_param, session: valid_session
      expect(assigns(:language)).to eq(language)
    end
  end

  describe "POST #create" do
    before {
      sign_in authorised
    }
    context "with valid params" do

      it "creates a new Language" do
        expect {
          post :create, language: valid_attributes, session: valid_session
        }.to change(Language, :count).by(1)
      end

      it "assigns a newly created language as @language" do
        post :create, language: valid_attributes, session: valid_session
        expect(assigns(:language)).to be_a(Language)
        expect(assigns(:language)).to be_persisted
      end

      it "redirects to the created language" do
        post :create, language: valid_attributes, session: valid_session
        expect(response).to redirect_to(Language.last)
      end
    end

    context "with invalid params" do
      before do
        sign_in authorised
      end
      it "assigns a newly created but unsaved language as @language" do
        post :create,language: invalid_attributes, session: valid_session
        expect(assigns(:language)).to be_a_new(Language)
      end

      it "re-renders the 'new' template" do
        post :create,language: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before {
      sign_in authorised
    }
    context "with valid params" do
      let(:new_attributes) {
        {english_name: 'Braun', welsh_name: "Hansen"}
      }

      it "updates the requested language" do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: new_attributes, session: valid_session
        language.reload
        expect(language.english_name).to eq("Braun")
      end

      it "assigns the requested language as @language" do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: valid_attributes, session: valid_session
        expect(assigns(:language)).to eq(language)
      end

      it "redirects to the language" do
        language = Language.create! valid_attributes
        put :update, id: language.to_param, language: valid_attributes, session: valid_session
        expect(response).to redirect_to(language)
      end
    end

    context "with invalid params" do
      before {
        sign_in authorised
      }
      it "assigns the language as @language" do
        language = Language.create! valid_attributes
        put :update,{id: language.to_param, language: invalid_attributes},session: valid_session
        expect(assigns(:language)).to eq(language)
      end

      it "re-renders the 'edit' template" do
        language = Language.create! valid_attributes
        put :update,id: language.to_param, language: invalid_attributes,session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before {
      sign_in authorised
    }
    it "destroys the requested language" do
      language = Language.create! valid_attributes
      expect {
        delete :destroy, id: language.to_param, session: valid_session
      }.to change(Language, :count).by(-1)
    end

    it "redirects to the languages list" do
      language = Language.create! valid_attributes
      delete :destroy, id: language.to_param, session: valid_session
      expect(response).to redirect_to(languages_url)
    end
  end
  end
end

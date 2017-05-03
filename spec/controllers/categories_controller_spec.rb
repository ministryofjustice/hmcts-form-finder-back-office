require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  context "Internal User" do
    let(:authorised) { create(:user) }

    before do
      sign_in :authorised
    end

    let(:valid_attributes) {attributes_for(:category)}

    let(:invalid_attributes) {{english_name: nil, welsh_name: nil}}

    let(:valid_session) { {} }

    describe("GET #index") do
      before {sign_in authorised}

      it "assigns all categories as @categories" do
        category = Category.create! valid_attributes
        get :index, params: {}, session: valid_session

        expect(assigns(:categories)).to eq([category])
      end
    end

    describe "GET #new" do
      before do
        sign_in authorised
      end
      it "assigns a new category as @category" do
        category = Category.create! valid_attributes
        get :new, params: {id: category.to_param}, session: valid_session
        expect(assigns(:category)).to be_a_new(Category)
      end
    end

    describe "GET #edit" do
      before do
        sign_in authorised
      end
      it "assigns the requested category as category" do
        category = Category.create! valid_attributes
        get :edit, id: category.id
        expect(assigns(:category)).to eq(category)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        before do
          sign_in authorised
        end
        it "creates a new Category" do
          expect do
            post :create, category: attributes_for(:category), session: valid_session
            #       post :create, params: {category: valid_attributes}, session: valid_session
          end.to change(Category, :count).by(1)
        end

        it "assigns a newly created category as @category" do
          post :create, category: attributes_for(:category), session: valid_session
          expect(assigns(:category)).to be_a(Category)
          expect(assigns(:category)).to be_persisted
        end

        it "redirects to the created category" do
          post :create, category: attributes_for(:category), session: valid_session
          expect(response).to redirect_to(Category.last)
        end
      end

      context "with invalid params" do
        before do
          sign_in authorised
        end
        it "assigns a newly created but unsaved category as @category" do
          post :create,category: invalid_attributes, session: valid_session
          expect(assigns(:category)).to be_a_new(Category)
        end

        it "re-renders the 'new' template" do
          post :create,category: invalid_attributes, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe("PUT #update") do
      context("with valid params") do

        let(:new_attributes) do
          {english_name: 'Braun', welsh_name: "Hansen"}
        end

        before do
          sign_in authorised
        end
        it "updates the requested category" do
          category = Category.create! valid_attributes
          post :create, category: valid_attributes, session: valid_session
          put :update, {id: category.to_param, category: new_attributes}, session: valid_session
          category.reload
          expect(category.english_name).to eq("Braun")
        end

        before do
          sign_in authorised
        end
        it "assigns the requested category as @category" do
          category = Category.create! valid_attributes
          put :update, {id: category.to_param, category: valid_attributes}, session: valid_session
          expect(assigns(:category)).to eq(category)
        end

        it "redirects to the category" do
          category = Category.create! valid_attributes
          put :update, {id: category.to_param, category: valid_attributes}, session: valid_session
          expect(response).to redirect_to(category)
        end
      end

      context "with invalid params" do
        before do
          sign_in authorised
        end
        it "assigns the category as @category" do
          category = Category.create! valid_attributes
          put :update, {id: category.to_param, category: invalid_attributes}, session: valid_session
          expect(assigns(:category)).to eq(category)
        end

        it "re-renders the 'edit' template" do
          category = Category.create! valid_attributes
          put :update, {id: category.to_param, category: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

  end

end

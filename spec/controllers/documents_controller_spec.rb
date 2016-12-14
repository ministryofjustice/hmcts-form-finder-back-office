require 'rails_helper'
require 'byebug'

RSpec.describe DocumentsController, type: :controller do

  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin if trying to access list of submitted documents" do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should be redirected to sigin if trying to access the new submitted documents page" do
      get :new
      expect( response ).to redirect_to( new_user_session_path )
    end


  end

  describe "registered user" do

    before :each do
      # This simulates an anonymous user
      sign_in create(:user)
    end

    it "should display list of submitted documents" do
      get :index
      expect( response ).to render_template( :index )
    end

    it "should display new submitted documents" do
      get :new
      expect( response ).to render_template( :new )
    end
  end




end
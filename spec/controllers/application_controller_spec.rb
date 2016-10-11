require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe 'setting the current user ' do

    let(:staff) { create(:user) }


    it 'should not set user instance variable if the user has not signed in'  do
      controller.set_user
      expect(@user).to be_nil
    end

    it 'should return the logged in user'  do
      sign_in staff

      expect(controller.set_user).to eq(staff)

    end
  end

end

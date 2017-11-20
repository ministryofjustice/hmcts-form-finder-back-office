module PageObjects
  module Sections
    class UserFormSection < SitePrism::Section
      element :firstname, '#user_first_name'
      element :surname, '#user_last_name'
      element :email, '#user_email'
      element :password, '#user_password'
      element :confirmation, '#user_password_confirmation'
      element :inactive, '#user_inactive'
    end
  end
end

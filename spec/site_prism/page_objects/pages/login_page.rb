module PageObjects
  module Pages
    class LoginPage < SitePrism::Page
      set_url '/'

      element :username_field, '#user_email'
      element :password_field, '#user_password'
      element :signin, 'input[type="submit"][value="Sign in"]'
      element :error_message, '.error-summary'

      def log_in(username, password)
        username_field.set(username)
        password_field.set(password)
        signin.click
      end
    end
  end
end

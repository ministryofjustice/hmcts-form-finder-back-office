# /en/users/new

module PageObjects
  module Pages
    module Users
      class NewPage < PageObjects::Pages::Base
        # NewPage inherits from Base
        set_url '/en/users/new'

        section :navigation,  PageObjects::Sections::NavigationSection, '.global-nav'
        section :user_form,   PageObjects::Sections::UserFormSection, '#new_user'

        element :error_heading,       'h1#error-summary-user-form'
        element :error_message,       'ul.error-summary-list'
        element :heading,             'h1.heading-small', text: 'Add user'
        element :first_name_field,    '#user_first_name'
        element :last_name_field,     '#user_last_name'
        element :email_field,         '#user_email'
        element :password_field,      '#user_password'
        element :confirmation_field,  '#user_password_confirmation'
        element :inactive_checkbox,   '#user_inactive'
        element :submit,              'input[type="submit"][value="Submit"]'

        def set_user(first_name, last_name, email, password, confirmation)
          first_name_field.set(first_name)
          last_name_field.set(last_name)
          email_field.set(email)
          password_field.set(password)
          confirmation_field.set(confirmation)
        end

        def set_active
          inactive_checkbox.set(false)
        end

        def set_inative
          inactive_checkbox.set(true)
        end
      end
    end
  end
end

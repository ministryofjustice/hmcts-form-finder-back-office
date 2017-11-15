# /en/users/1/edit

module PageObjects
  module Pages
    module Users
      class EditPage < PageObjects::Pages::Base
        # EditPage inherits from Base
        set_url '/en/users/{id}/edit'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :user_form, PageObjects::Sections::UserFormSection, '.edit_user'

        element :error_heading, 'h1#eerror-summary-user-form'
        element :error_message, 'ul.error-summary-list li'
        element :heading, 'h1.heading-small', text: 'Edit user'
      end
    end
  end
end

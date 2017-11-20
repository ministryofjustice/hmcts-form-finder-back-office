# /en/users/new

module PageObjects
  module Pages
    module Users
      class NewPage < PageObjects::Pages::Base
        # NewPage inherits from Base
        set_url '/en/users/new'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :user_form, PageObjects::Sections::UserFormSection, '#new_user'

        element :error_heading, 'h1#eerror-summary-user-form'
        element :error_message, 'ul.error-summary-list'
        element :heading, 'h1.heading-small', text: 'Add user'
      end
    end
  end
end

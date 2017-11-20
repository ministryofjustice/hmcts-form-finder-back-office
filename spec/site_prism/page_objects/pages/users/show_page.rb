# /en/users/1

module PageObjects
  module Pages
    module Users
      class ShowPage < PageObjects::Pages::Base
        # ShowPage inherits from Base
        set_url '/en/users/{id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :notice, 'h1#notice-summary-heading', text: 'User successfully updated.'
        element :heading, 'h1.heading-small', text: 'User summary'
        element :first_name_heading, 'h3.heading-small', text: 'First name'
        element :surname_heading, 'h3.heading-small', text: 'Surname'
        element :email_address_heading, 'h3.heading-small', text: 'Email address'
        element :inactive_heading, 'h3.heading-small', text: 'Inactive'
      end
    end
  end
end

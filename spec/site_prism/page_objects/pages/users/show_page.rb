# /en/users/1

module PageObjects
  module Pages
    module Users
      class ShowPage < PageObjects::Pages::Base
        # ShowPage inherits from Base
        set_url '/en/users/{id}'
        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        element :creation_notice, 'h1#notice-summary-heading', text: 'User successfully created.'
        element :update_notice, 'h1#notice-summary-heading', text: 'User successfully updated.'
        element :heading, 'h1.heading-small', text: 'User summary'
        element :done, 'a.button.button-left-spacing'
      end
    end
  end
end

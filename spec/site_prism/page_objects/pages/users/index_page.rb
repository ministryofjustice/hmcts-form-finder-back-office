# /en/users

module PageObjects
  module Pages
    module Users
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url '/en/users'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :user_lists, PageObjects::Sections::IndexTablesSection, '.table-container.container'

        element :heading, 'h1.heading-small', text: 'User accounts'
        element :add_user_link, 'a[href="/en/users/new"]'
      end
    end
  end
end

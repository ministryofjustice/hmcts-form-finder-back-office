# /en/categories/1

module PageObjects
  module Pages
    module Categories
      class ShowPage < PageObjects::Pages::Base
        # ShowPage inherits from Base
        set_url '/en/categories/{id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
      end
    end
  end
end

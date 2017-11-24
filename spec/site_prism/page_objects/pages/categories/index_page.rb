# /en/categories

module PageObjects
  module Pages
    module Categories
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url '/en/categories'
        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :active_list, PageObjects::Sections::IndexTablesSection, '#active_list'
        section :inactive_list, PageObjects::Sections::IndexTablesSection, '#inactive_list'
        element :heading, 'h1.heading-small', text: 'Categories'
        element :sub_heading, 'h2.heading-medium'
      end
    end
  end
end

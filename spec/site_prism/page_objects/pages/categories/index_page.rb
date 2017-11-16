# /en/categories

module PageObjects
  module Pages
    module Categories
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url '/en/categories'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :category_lists, PageObjects::Sections::IndexTablesSection, '.table-container.container'

        element :heading, 'h1.heading-small', text: 'Categories'
      end
    end
  end
end

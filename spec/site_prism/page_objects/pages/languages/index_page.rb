# /en/languages

module PageObjects
  module Pages
    module Languages
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url '/en/languages'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :language_lists, PageObjects::Sections::IndexTablesSection, '.table-container.container'

        element :heading, 'h1.heading-small', text: 'Languages'
        element :add_language_link, 'a[href="/en/languages/new"]'
      end
    end
  end
end

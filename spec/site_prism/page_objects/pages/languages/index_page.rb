# /en/languages

module PageObjects
  module Pages
    module Languages
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url '/en/languages'
        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :active_list, PageObjects::Sections::IndexTablesSection, '#active_list'
        section :inactive_list, PageObjects::Sections::IndexTablesSection, '#inactive_list'
        element :heading, 'h1.heading-small', text: 'Languages'
        element :sub_heading, 'h2.heading-medium'
      end
    end
  end
end

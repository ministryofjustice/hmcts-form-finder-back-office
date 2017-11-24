# /en/doc_attachment_types

module PageObjects
  module Pages
    module Types
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url 'en/doc_attachment_types'
        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :active_list, PageObjects::Sections::IndexTablesSection, '#active_list'
        section :inactive_list, PageObjects::Sections::IndexTablesSection, '#inactive_list'
        element :heading, 'h1.heading-small', text: 'Document types'
        element :sub_heading, 'h2.heading-medium'
      end
    end
  end
end

# /en/doc_attachment_types

module PageObjects
  module Pages
    module Types
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url 'en/doc_attachment_types'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :type_lists, PageObjects::Sections::IndexTablesSection, '.table-container.container'

        element :heading, 'h1.heading-small', text: 'Document types'
        element :add_language_link, 'a[href="/en/doc_attachment_types/new"]'
      end
    end
  end
end

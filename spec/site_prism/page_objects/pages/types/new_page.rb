# /en/doc_attachment_types/new

module PageObjects
  module Pages
    module Types
      class NewPage < PageObjects::Pages::Base
        # NewPage inherits from Base
        set_url '/en/doc_attachment_types/new'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :error_heading, 'h1#error-summary-add-type'
        element :error_message, 'ul.error-summary-list'
        element :heading, 'h1.heading-small', text: 'Add type'
      end
    end
  end
end

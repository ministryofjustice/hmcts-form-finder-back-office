# en/link/documents/link?document=1

module PageObjects
  module Pages
    module Documents
      class LinkPage < PageObjects::Pages::Base
        # LinkPage inherits from Base
        set_url 'en/link/documents/link?document={id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :autocomplete, PageObjects::Sections::AutoCompleteSection, '.autocomplete__wrapper'

        element :main_heading, 'h1.heading-small', text: 'Add document'
        element :section_heading, 'h2.heading-large', text: 'Link documents'
        element :linked_list, '#linked-list'
      end
    end
  end
end

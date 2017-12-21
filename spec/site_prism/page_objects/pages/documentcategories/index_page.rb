# en/documents/1

module PageObjects
  module Pages
    module DocumentCategories
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url 'en/documents/{id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :autocomplete, PageObjects::Sections::AutoCompleteSection, '.autocomplete__wrapper'

        element :main_heading, 'h1.heading-small', text: 'Add document'
        element :section_heading, 'h2.heading-large', text: 'Assign categories'
        element :assignment_list, '#assignment-list'
      end
    end
  end
end

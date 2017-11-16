# /en/categories/new

module PageObjects
  module Pages
    module Documents
      class NewPage < PageObjects::Pages::Base
        # NewPage inherits from Base
        set_url '/en/documents/new'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :document_form, PageObjects::Sections::DocumentFormSection, '#new_document'

        element :main_heading, 'h1.heading-small', text: 'Add document'
      end
    end
  end
end

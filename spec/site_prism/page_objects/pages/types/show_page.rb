# /en/doc_attachment_types/1

module PageObjects
  module Pages
    module Types
      class ShowPage < PageObjects::Pages::Base
        # ShowPage inherits from Base
        set_url '/en/doc_attachment_types/{id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :notice, 'h1#notice-summary-heading', text: 'Type successfully updated.'
        element :heading, 'h1.heading-small', text: 'Type summary'
      end
    end
  end
end

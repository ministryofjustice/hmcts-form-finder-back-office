# /en/doc_attachment_types/1/edit

module PageObjects
  module Pages
    module Types
      class EditPage < PageObjects::Pages::Base
        # EditPage inherits from Base
        set_url '/en/doc_attachment_types/{id}/edit'
        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        element :error_heading, 'h1#error-summary-add-type'
        element :error_message, 'ul.error-summary-list'
        element :heading, 'h1.heading-small', text: 'Edit type'
      end
    end
  end
end

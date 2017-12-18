# /en/documents/1/edit

module PageObjects
  module Pages
    module Documents
      class EditPage < PageObjects::Pages::Base
        # EditPage inherits from Base
        set_url '/en/documents/{id}/edit'

        section :navigation,    PageObjects::Sections::NavigationSection, '.global-nav'
        section :document_form, PageObjects::Sections::DocumentFormSection, '#edit_document_{id}'

        element :error_heading, 'h1#error-summary-add-document'
        element :error_message, 'ul.error-summary-list'
        element :main_heading,  'h1.heading-small', text: 'Edit document'
      end
    end
  end
end

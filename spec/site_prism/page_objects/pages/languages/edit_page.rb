# /en/languages/1/edit

module PageObjects
  module Pages
    module Languages
      class EditPage < PageObjects::Pages::Base
        # EditPage inherits from Base
        set_url '/en/languages/{id}/edit'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :languages_form, PageObjects::Sections::LanguageFormSection, '.edit_language'

        element :error_heading, 'h1#error-summary-add-language'
        element :error_message, 'ul.error-summary-list'
        element :heading, 'h1.heading-small', text: 'Edit language'
      end
    end
  end
end

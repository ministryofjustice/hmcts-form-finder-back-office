# /en/languages/new

module PageObjects
  module Pages
    module Languages
      class NewPage < PageObjects::Pages::Base
        # NewPage inherits from Base
        set_url '/en/languages/new'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :languages_form, PageObjects::Sections::LanguageFormSection, '#new_language'

        element :error_heading, 'h1#error-summary-add-language'
        element :error_message, 'ul.error-summary-list'
        element :heading,       'h1.heading-small', text: 'Add language'
        element :submit,        'input[type="submit"][value="Submit"]'
      end
    end
  end
end

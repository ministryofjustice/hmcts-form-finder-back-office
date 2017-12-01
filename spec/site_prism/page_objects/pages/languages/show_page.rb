# /en/languages/1

module PageObjects
  module Pages
    module Languages
      class ShowPage < PageObjects::Pages::Base
        # ShowPage inherits from Base
        set_url '/en/languages/{id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :creation_notice, 'h1#notice-summary-heading', text: 'Language successfully created.'
        element :update_notice,   'h1#notice-summary-heading', text: 'Language successfully updated.'
        element :heading,         'h1.heading-small', text: 'Language summary'
        element :done,            'a.button.button-left-spacing'
      end
    end
  end
end

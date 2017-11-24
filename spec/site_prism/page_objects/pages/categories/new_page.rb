# /en/categories/new

module PageObjects
  module Pages
    module Categories
      class NewPage < PageObjects::Pages::Base
        # NewPage inherits from Base
        set_url '/en/categories/new'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :error_heading, 'h1#error-summary-add-category'
        element :error_message, 'ul.error-summary-list li'
        element :heading, 'h1.heading-small', text: 'Add category'
      end
    end
  end
end

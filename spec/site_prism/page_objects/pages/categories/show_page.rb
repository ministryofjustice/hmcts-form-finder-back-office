# /en/categories/1

module PageObjects
  module Pages
    module Categories
      class ShowPage < PageObjects::Pages::Base
        # ShowPage inherits from Base
        set_url '/en/categories/{id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :creation_notice, 'h1#notice-summary-heading', text: 'Category successfully created.'
        element :update_notice, 'h1#notice-summary-heading', text: 'Category successfully updated.'
        element :heading, 'h1.heading-small', text: 'Category summary'
      end
    end
  end
end

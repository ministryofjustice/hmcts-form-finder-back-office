# /en/categories/1/edit

module PageObjects
  module Pages
    module Categories
      class EditPage < PageObjects::Pages::Base
        # EditPage inherits from Base
        set_url '/en/categories/{id}/edit'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :error_heading, 'h1#error-summary-add-category'
        element :error_message, 'ul.error-summary-list'
        element :heading, 'h1.heading-small', text: 'Edit category'
      end
    end
  end
end

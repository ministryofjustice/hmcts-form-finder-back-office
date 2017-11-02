# /en/categories/new

module PageObjects
  module Pages
    module Categories
      class AddPage < SitePrism::Page
        element :heading, 'h1.heading-small', text: 'Add category'
        section :category_form, PageObjects::Sections::CategoryFormSection, '#new_category'
      end
    end
  end
end

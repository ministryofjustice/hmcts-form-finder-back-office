# /en/categories/1/edit
module PageObjects
  module Pages
    module Categories
      class EditPage < SitePrism::Page
        element :heading, 'h1.heading-small', text: 'Edit category'
        section :category_form, PageObjects::Sections::CategoryFormSection, '#edit_category_1'
      end
    end
  end
end

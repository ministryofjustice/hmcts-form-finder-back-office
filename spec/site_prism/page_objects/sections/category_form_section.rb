module PageObjects
  module Sections
    class CategoryFormSection < SitePrism::Section
      element :english_name, 'input##category_english_name'
      element :welsh_name, 'input##category_welsh_name'
      element :inactive, 'input##category_inactive'
      element :submit, 'input[type="submit"][value="Save"]'
      element :cancel, 'a[href="/en/categories"]'
    end
  end
end

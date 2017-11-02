module PageObjects
  module Sections
    class LanguageFormSection < SitePrism::Section
      element :english_name, 'input#language_english_name'
      element :welsh_name, 'input#language_welsh_name'
      element :inactive, 'input#language_inactive'
      element :code, 'input#language_code'
      element :submit, 'input[type="submit"][value="Save"]'
      element :cancel, 'a[href="/en/languages"]'
    end
  end
end

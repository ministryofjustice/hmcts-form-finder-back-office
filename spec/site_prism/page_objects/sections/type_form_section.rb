module PageObjects
  module Sections
    class TypeFormSection < SitePrism::Section
      element :english_name, 'input#doc_attachment_type_english_name'
      element :welsh_name, 'input#doc_attachment_type_welsh_name'
      element :inactive, 'input#doc_attachment_type_inactive'
      element :submit, 'input[type="submit"][value="Save"]'
      element :cancel, 'a[href="/en/doc_attachment_types"]'
    end
  end
end

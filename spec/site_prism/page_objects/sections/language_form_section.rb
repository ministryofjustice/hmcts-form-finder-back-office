module PageObjects
  module Sections
    class LanguageFormSection < SitePrism::Section
      element :language_code, '#language_code'

      def add_language_code(code)
        language_code.set(code)
      end
    end
  end
end

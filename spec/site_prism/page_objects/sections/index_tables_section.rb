module PageObjects
  module Sections
    class IndexTablesSection < SitePrism::Section
      element :action, 'td.action'
      element :code, 'td.language_code'
      element :email, 'td.email'
      element :english_name, 'td.english'
      element :name, 'td.name'
      element :welsh_name, 'td.welsh'
    end
  end
end

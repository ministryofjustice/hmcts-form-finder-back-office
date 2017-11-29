module PageObjects
  module Sections
    class IndexTablesSection < SitePrism::Section
      element :action, 'td.action'
      element :code, 'td.language_code'
      element :email, 'td.email'
      element :second_email, 'tr:nth-child(2) td.email'
      element :third_email, 'tr:nth-child(3) td.email'
      element :english_name, 'td.english'
      element :name, 'td.name'
      element :second_name, 'tr:nth-child(2) td.name'
      element :third_name, 'tr:nth-child(3) td.name'
      element :welsh_name, 'td.welsh'
    end
  end
end

module PageObjects
  module Sections
    class NavigationSection < SitePrism::Section
      elements :all_links, 'a'
      element :active_link, 'a.active'
      element :documents, 'a[href="http://www.example.com/en/documents"]'
      element :categories, 'a[href="http://www.example.com/en/categories"]'
      element :languages, 'a[href="http://www.example.comen/languages"]'
      element :types, 'a[href="http://www.example.com/en/doc_attachment_types"]'
      element :user_accounts, 'a[href="http://www.example.com/en/users"]'
    end
  end
end

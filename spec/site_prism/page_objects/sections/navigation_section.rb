module PageObjects
  module Sections
    class NavigationSection < SitePrism::Section
      elements :all_links, 'a'
      element :active_link, 'a.active'
      element :documents, 'a[href="/en/documents"]'
      element :categories, 'a[href="/en/categories"]'
      element :languages, 'a[href="/en/languages"]'
      element :document_types, 'a[href="/en/doc_attachment_types"]'
      element :user_accounts, 'a[href="/en/users"]'
    end
  end
end

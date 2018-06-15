module PageObjects
  module Sections
    class NavigationSection < SitePrism::Section
      elements :all_links, 'a'
      element :active_link, 'a.active'
      element :redirects, 'a[href="http://www.example.com/en/redirect_urls"]'
      element :user_accounts, 'a[href="http://www.example.com/en/users"]'
    end
  end
end

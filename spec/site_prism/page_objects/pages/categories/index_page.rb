# /en/categories
module PageObjects
  module Pages
    module Categories
      class IndexPage < SitePrism::Page
        set_url '/en/categories'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :footer, PageObjects::Sections::FooterSection, '#footer'

        element :heading, 'h1.heading-small', text: 'Categories'
        element :category_count_subheading, 'h2', text: 'Currently 20 categories are active'

      end
    end
  end
end

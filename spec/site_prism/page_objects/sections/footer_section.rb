module PageObjects
  module Sections
    class FooterSection < SitePrism::Section
      element :ogl_text, '.open-government-licence'
      element :ogl_link, 'p.logo a[href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/"]'
      element :copyright_text, '.copyright'
      element :copyright_link, 'a[href="https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/"]'
    end
  end
end

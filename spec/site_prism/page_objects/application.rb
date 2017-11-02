module PageObjects
  module Pages
    module Application
      def app_pages
        @app_pages ||= {}
      end

      def app_sections
        @app_sections ||= {}
      end

      {
        categories_index: 'Categories::IndexPage',
        documents_index: 'Documents::IndexPage',
        login: 'LoginPage'
      }.each do |page_name, page_class|
        full_page_class = "PageObjects::Pages::#{page_class}"

        define_method "#{page_name}_page" do
          app_pages[page_name] ||= full_page_class.constantize.send :new
        end
      end

      {
        category_form: 'CategoryFormSection',
        footer: 'FooterSection',
        langage_form: 'LanguageFormSection',
        navigation: 'NavigationSection',
        type_form: 'TypeFormSection'
      }.each do |section_name, section_class|
        full_section_class = "PageObjects::Sections::#{section_class}"

        define_method "#{section_name}_section" do |rendered|
          app_sections[section_name] ||= full_section_class.constantize.send :new, nil, Capybara.string(rendered)
        end
      end
    end
  end
end

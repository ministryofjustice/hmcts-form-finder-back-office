require 'page_objects/pages/base'

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
        edit_user:                  'Users::EditPage',
        login:                      'LoginPage',
        new_user:                   'Users::NewPage',
        show_user:                  'Users::ShowPage',
        users_index:                'Users::IndexPage'
      }.each do |page_name, page_class|
        full_page_class = "PageObjects::Pages::#{page_class}"

        define_method "#{page_name}_page" do
          app_pages[page_name] ||= full_page_class.constantize.__send__ :new
        end
      end

      {
        footer:             'FooterSection',
        index_tables:       'IndexTablesSection',
        navigation:         'NavigationSection',
        user_form:          'UserFormSection'
      }.each do |section_name, section_class|
        full_section_class = "PageObjects::Sections::#{section_class}"

        define_method "#{section_name}_section" do |rendered|
          app_sections[section_name] ||= full_section_class.constantize.__send__ :new, nil, Capybara.string(rendered)
        end
      end
    end
  end
end

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
        categories_index:           'Categories::IndexPage',
        assign_categories:   'DocumentCategories::IndexPage',
        documents_index:            'Documents::IndexPage',
        edit_category:              'Categories::EditPage',
        edit_document:              'Documents::EditPage',
        edit_language:              'Languages::EditPage',
        edit_type:                  'Types::EditPage',
        edit_user:                  'Users::EditPage',
        languages_index:            'Languages::IndexPage',
        link_documents:             'Documents::Link',
        login:                      'LoginPage',
        new_category:               'Categories::NewPage',
        new_document:               'Documents::NewPage',
        new_language:               'Languages::NewPage',
        new_type:                   'Types::NewPage',
        new_user:                   'Users::NewPage',
        show_category:              'Categories::ShowPage',
        show_document:              'Documents::ShowPage',
        show_language:              'Languages::ShowPage',
        show_type:                  'Types::ShowPage',
        show_user:                  'Users::ShowPage',
        types_index:                'Types::IndexPage',
        users_index:                'Users::IndexPage'
      }.each do |page_name, page_class|
        full_page_class = "PageObjects::Pages::#{page_class}"

        define_method "#{page_name}_page" do
          app_pages[page_name] ||= full_page_class.constantize.send :new
        end
      end

      {
        autocomplete:       'AutoCompleteSection',
        document_form:      'DocumentFormSection',
        footer:             'FooterSection',
        index_tables:       'IndexTablesSection',
        langage_form:       'LanguageFormSection',
        navigation:         'NavigationSection',
        user_form:          'UserFormSection'
      }.each do |section_name, section_class|
        full_section_class = "PageObjects::Sections::#{section_class}"

        define_method "#{section_name}_section" do |rendered|
          app_sections[section_name] ||= full_section_class.constantize.send :new, nil, Capybara.string(rendered)
        end
      end
    end
  end
end

module PageObjects
  module Pages
    module Application
      def app_pages
        @app_pages ||= {}
      end
      {
        login:  'LoginPage'
      }.each do |page_name, page_class|
        full_page_class = "PageObjects::Pages::#{page_class}"
        define_method "#{page_name}_page" do
          app_pages[page_name] ||= full_page_class.constantize.send :new
        end
      end
    end
  end
end

module ActionView
  class TestCase
    class TestController
      def default_url_options(*)
        { locale: I18n.default_locale }
      end
    end
  end
end

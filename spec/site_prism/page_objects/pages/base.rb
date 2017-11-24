module PageObjects
  module Pages
    class Base < SitePrism::Page

      def fill_in_field(css_id, text)
        find("input##{css_id}").set("#{text}")
      end

      def toggle_inactive(css_id, value)
        find("input##{css_id}").set(value)
      end

      def new_item(option)
        find_link("a.button[href='/en/#{option}/new']").click
      end

      def to_top
        find_link("a[href='#content']").click
      end
    end
  end
end

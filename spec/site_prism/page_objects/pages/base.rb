module PageObjects
  module Pages
    class Base < SitePrism::Page
      def add_english_name(css_id, english_name)
        find("input##{css_id}").set("#{english_name}")
      end

      def add_welsh_name(css_id, welsh_name)
        find("input##{css_id}").set("#{welsh_name}")
      end

      def make_inactive(css_id)
        find("input##{css_id}").set(true)
      end

      def add_button(option)
        find_link("a.button[href='/en/#{option}/new]'").click
      end

      def cancel_done_button(option)
        find_link("a.button[href='/en/#{option}]'").click
      end

      def edit_button(option, id)
        find_link("a[href='/en/#{option}/#{id}/edit']").click
      end

      def save_submit_button(text)
        # Assign, Continue, Edit, Link, Save amd Submit buttons
        find("input[type='submit'][value='#{text}']").click
      end

      def to_top
        find_link("a[href='#content']").click
      end
    end
  end
end

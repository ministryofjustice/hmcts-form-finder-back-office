# /en
module PageObjects
  module Pages
    module Documents
      class IndexPage < SitePrism::Page
        set_url '/en'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :footer, PageObjects::Sections::FooterSection, '#footer'

        element :heading, 'h1.heading-small', text: 'Documents'
        element :add_document_subheading, 'h2', text: 'Add document'
        element :add_document_link, 'a#add-document'
        element :edit_document_subheading, 'h2', text: 'Edit document'
        element :auto_suggest_list, 'select#auto-suggest-list'
        element :edit_button, 'input[type="submit"][value="Edit"]'
        element :publishing_queue_subheading, 'h2', text: 'To be published'
        element :queue, 'table#publication-queue'
      end
    end
  end
end

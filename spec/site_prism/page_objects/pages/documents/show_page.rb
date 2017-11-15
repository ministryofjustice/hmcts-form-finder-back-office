# /en/documents/1

module PageObjects
  module Pages
    module Documents
      class ShowPage < PageObjects::Pages::Base
        # ShowPage inherits from Base
        set_url '/en/documents/{id}'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'

        element :main_heading, 'h1.heading-small', text: 'Summary'
        element :document_details_heading, 'h2.heading-large', text: 'Document details'
        element :edit_details_link, 'a.edit-link[href="/en/documents/{id}/edit?document={id}"]'
        element :filename_label, 'h3.heading-small', text: 'Document uploaded'
        # 'ex107-bil.pdf'
        element :reference_label, 'h3.heading-small', text: 'Reference'
        # 'EX107'
        element :title_label, 'h3.heading-small', text: 'Title'
        # 'Cais am Drawsgrifio Tap / Tape transcription request'
        element :summary_label, 'h3.heading-small', text: 'Summary'
        # Summary text
        element :type_label, 'h3.heading-small', text: 'Document type'
        # Form
        element :language_label, 'h3.heading-small', text: 'Language'
        # 'Welsh / Bilingual'
        element :version_date_label, 'h3.heading-small', text: 'Document version date'
        # 01/01/2007
        element :publication_date_label, 'h3.heading-small', text: 'Set publication date'
        # 15/09/2017
        element :category_section_heading, 'h2.heading-large', text: 'Categories'
        element :edit_details_link, 'a.edit-link[href="/en/documentcategories?document={id}"]'
        # ul.list
        #   li
        #     'County Court'
        element :linked_docs_heading, 'h2.heading-large', text: 'Linked documents'
        element :edit_details_link, 'a.edit-link[href="/en/link/documents/link?document={id}"]'
        # ul.list
        #   li
        #     'EX107 Gwybodaeth / EX107 Info'
        #     span.attributes
        #       'Welsh / Bilingual'
        #       'PDF'
        element :done_button, '.button'

        def edit_details
          edit_details_link.click
        end

        def edit_assigned_categories
          edit_details_link.click
        end

        def edit_linked_documents
          edit_linked_documents.click
        end
      end
    end
  end
end

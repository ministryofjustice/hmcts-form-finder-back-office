# /en

module PageObjects
  module Pages
    module Documents
      class IndexPage < PageObjects::Pages::Base
        # IndexPage inherits from Base
        set_url '/en'

        section :navigation, PageObjects::Sections::NavigationSection, '.global-nav'
        section :autocomplete, PageObjects::Sections::AutoCompleteSection, '.autocomplete__wrapper'

        element :heading,                     'h1.heading-small', text: 'Documents'
        element :add_document_subheading,     'h2', text: 'Add document'
        element :add_document_button,         '#add-document.button'
        element :edit_document_subheading,    'h2', text: 'Edit document'
        element :edit_document_button,        'input.auto-suggest.button-secondary'
        element :publishing_queue_subheading, 'h2', text: 'To be published'

        sections :publication_queue,          '#publication_queue tbody tr.item' do
          element :date,                      'td.date'
          element :reference,                 'td.reference'
          element :title,                     'td.title'
        end
      end
    end
  end
end

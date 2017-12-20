module PageObjects
  module Sections
    class DocumentFormSection < SitePrism::Section
      element :file_picker,                    '#document_attachment'
      element :reference_field,                '#document_code'
      element :title_field,                    '#document_title'
      element :summary_field,                  '#document_summary'
      element :version_day_field,              '#document_content_date_dd'
      element :version_month_field,            '#document_content_date_mm'
      element :version_year_field,             '#document_content_date_yyyy'
      element :publication_day_field,          '#document_published_date_dd'
      element :publication_month_field,        '#document_published_date_mm'
      element :publication_year_field,         '#document_published_date_yyyy'
      element :inactive_checkbox,              '#document_inactive'
      element :continue,                       'input[type="submit"][value="Continue"]'

      def select_file
        attach_file 'Choose document', Rails.root.join('spec/support/fixtures/Blank.docx')
      end

      def fill_in_reference
        reference_field.set(Faker::Lorem.characters(8))
      end

      def fill_in_title
        title_field.set(Faker::Lorem.characters(32))
      end

      def fill_in_summary
        summary_field.set(Faker::Lorem.characters(132))
      end

      def fill_in_content_date
        version_day_field.set(Time.zone.now.day)
        version_month_field.set(Time.zone.now.month)
        version_year_field.set(Time.zone.now.year)
      end

      def fill_in_publication_date
        publication_day_field.set(Time.zone.now.day)
        publication_month_field.set(Time.zone.now.month)
        publication_year_field.set(Time.zone.now.year)
      end

      def make_inactive
        inactive_checkbox.set(true)
      end
    end
  end
end

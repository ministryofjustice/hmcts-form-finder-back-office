module PageObjects
  module Sections
    class DocumentFormSection < SitePrism::Section
      element :file_picker, 'input[type="file"]#document_attachment'
      element :reference_field, 'input[type="text"]#document_code'
      element :reference_field, 'input[type="text"]#document_code'
      element :summary_field, 'input[type="textarea"]#document_summary'
      # element :type_field, 'input[type="radio"]#document_doc_attachment_type_id_#{id}'
      element :language_field, 'select#document_language_id'
      element :version_day_field, 'input[type="text"]#document_content_date_dd'
      element :version_month_field, 'input[type="text"]#document_content_date_mm'
      element :version_year_field, 'input[type="text"]#document_content_date_yyyy'
      element :publication_day_field, 'input[type="text"]#document_published_date_dd'
      element :publication_month_field, 'input[type="text"]#document_published_date_mm'
      element :publication_year_field, 'input[type="text"]#document_published_date_yyyy'
      element :inactive_checkbox, 'input[type="checkbox"]#document_inactive'
    end
  end
end

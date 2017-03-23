module Validators
  module ValueCheck

    def has_a_name
      if nil_or_empty(english_name) && nil_or_empty(welsh_name)
        errors[:base] << "Must have a name"
      end
    end

    def only_inactive_if_not_used
      the_collection = nil
      the_attribute = nil
      the_error = nil

      if self.class == DocAttachmentType
        the_collection = Document
        the_attribute = :doc_attachment_type_id
        the_error = "Can't make a Type inactive when it is still in use. Please remove all the documents from the type."
      elsif self.class == Language
        the_collection = Document
        the_attribute = :language_id
        the_error = "Can't make a Language inactive when it is still in use. Please remove all the documents from the language."
      elsif self.class == Category
        the_collection = DocumentCategory
        the_attribute = :category_id
        the_error = "Can't make a Category inactive when it is still in use. Please remove all the documents from the category."
      else
        errors[:base] << "There has been a problem, please contact your administrator"
      end
      if inactive && the_collection.where(the_attribute => id).count > 0
        errors[:base] << the_error
      end
    end

    private

    def nil_or_empty(x)
      if x.nil?
        true
      elsif x.empty?
        true
      else
        false
      end
    end
  end
end

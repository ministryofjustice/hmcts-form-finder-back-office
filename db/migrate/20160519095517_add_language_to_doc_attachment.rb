class AddLanguageToDocAttachment < ActiveRecord::Migration
  def change
    add_column :doc_attachments, :language_id, :integer
  end
end

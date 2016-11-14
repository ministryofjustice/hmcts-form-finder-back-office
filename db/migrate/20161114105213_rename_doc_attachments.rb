class RenameDocAttachments < ActiveRecord::Migration
  def change
    rename_table :doc_attachments, :documents
  end
end

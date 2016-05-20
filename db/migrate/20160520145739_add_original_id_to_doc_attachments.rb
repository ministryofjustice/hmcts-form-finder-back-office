class AddOriginalIdToDocAttachments < ActiveRecord::Migration
  def change
    add_column :doc_attachments, :original_id, :integer
  end
end

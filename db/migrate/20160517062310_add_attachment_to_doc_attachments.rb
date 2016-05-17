class AddAttachmentToDocAttachments < ActiveRecord::Migration
  def up
    add_attachment :doc_attachments, :attachment
  end

  def down
    remove_attachment :doc_attachments, :attachment
  end
end

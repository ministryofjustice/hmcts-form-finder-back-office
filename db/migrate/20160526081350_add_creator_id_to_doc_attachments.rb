class AddCreatorIdToDocAttachments < ActiveRecord::Migration
  def change
    add_column :doc_attachments, :creator_id, :integer
  end
end

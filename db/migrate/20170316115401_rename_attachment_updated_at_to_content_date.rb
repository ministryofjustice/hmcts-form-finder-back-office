class RenameAttachmentUpdatedAtToContentDate < ActiveRecord::Migration
  def change
    rename_column :documents, :attachment_updated_at, :content_date
  end
end

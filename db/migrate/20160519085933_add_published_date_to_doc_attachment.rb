class AddPublishedDateToDocAttachment < ActiveRecord::Migration
  def change
    add_column :doc_attachments, :published_date, :date
  end
end

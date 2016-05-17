class CreateDocAttachments < ActiveRecord::Migration
  def change
    create_table :doc_attachments do |t|
      t.string :code
      t.string :title
      t.string :category
      t.integer :doc_attachment_type_id, null:false

      t.timestamps null: false
    end
  end
end

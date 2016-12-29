class CreateDocAttachmentTypes < ActiveRecord::Migration
  def change
    create_table :doc_attachment_types do |t|
      t.string :english_name
      t.string :welsh_name

      t.timestamps null: false
    end
  end
end

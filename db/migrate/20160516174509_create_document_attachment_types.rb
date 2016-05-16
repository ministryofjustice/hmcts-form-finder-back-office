class CreateDocumentAttachmentTypes < ActiveRecord::Migration
  def change
    create_table :document_attachment_types do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

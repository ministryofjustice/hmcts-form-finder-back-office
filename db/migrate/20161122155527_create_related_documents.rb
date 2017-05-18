class CreateRelatedDocuments < ActiveRecord::Migration
  def change
    create_table :related_documents do |t|
      t.integer :document_id
      t.integer :linked_document_id
    end

    add_index(:related_documents, [:document_id, :linked_document_id], unique: true)
    add_index(:related_documents, [:linked_document_id, :document_id], unique: true)
  end
end

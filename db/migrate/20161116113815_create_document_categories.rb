class CreateDocumentCategories < ActiveRecord::Migration
  def change
    create_table :document_categories do |t|
      t.references :document, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end

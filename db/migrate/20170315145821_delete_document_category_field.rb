class DeleteDocumentCategoryField < ActiveRecord::Migration
  def change
    remove_column :documents, :category, :string
  end
end

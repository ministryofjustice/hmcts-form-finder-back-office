class AddOriginalUrlToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :original_url, :string
  end
end

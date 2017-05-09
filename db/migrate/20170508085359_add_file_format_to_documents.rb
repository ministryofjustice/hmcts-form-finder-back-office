class AddFileFormatToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :file_format, :string
  end
end

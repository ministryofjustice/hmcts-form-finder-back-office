class AddInactiveToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :inactive, :boolean
  end
end
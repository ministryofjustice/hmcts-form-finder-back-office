class AddInactiveToTypes < ActiveRecord::Migration
  def change
    add_column :doc_attachment_types, :inactive, :boolean, default: false
  end
end

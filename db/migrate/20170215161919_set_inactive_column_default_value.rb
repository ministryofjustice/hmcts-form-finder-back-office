class SetInactiveColumnDefaultValue < ActiveRecord::Migration
  def change
    change_column :categories, :inactive, :boolean, default: false
    change_column :documents, :inactive, :boolean, default: false
    change_column :languages, :inactive, :boolean, default: false
    change_column :users, :inactive, :boolean, default: false
  end
end

class AddInactiveToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :inactive, :boolean
  end
end

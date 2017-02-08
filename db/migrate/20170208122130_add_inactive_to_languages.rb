class AddInactiveToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :inactive, :boolean
  end
end
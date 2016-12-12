class AddLanguageCodes < ActiveRecord::Migration
  def change
    add_column :languages, :code, :string, null: false
  end
end

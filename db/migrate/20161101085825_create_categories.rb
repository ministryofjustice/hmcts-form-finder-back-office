class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :english_name
      t.string :welsh_name

      t.timestamps null: false
    end
  end
end

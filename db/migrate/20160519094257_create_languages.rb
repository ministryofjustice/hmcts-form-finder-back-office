class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :old_language_id
      t.string :name, null:false

      t.timestamps null: false
    end
  end
end

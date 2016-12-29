class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :english_name
      t.string :welsh_name
      t.string :code

      t.timestamps null: false
    end
  end
end

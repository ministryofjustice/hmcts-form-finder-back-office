class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :english_name
      t.string :welsh_name
<<<<<<< c840566d3bd171f0a39ac707c3bb344089b8a647:db/migrate/20161220144036_create_languages.rb
      t.string :code, null:false
=======
      t.string :code
>>>>>>> Language CRUD functions added:db/migrate/20161220144036_create_languages.rb

      t.timestamps null: false
    end
  end
end

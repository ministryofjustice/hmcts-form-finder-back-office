class CreateRedirectUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :redirect_urls do |t|
      t.string :incoming
      t.string :outgoing
      t.boolean :inactive, default: false
      t.timestamps
    end
  end
end

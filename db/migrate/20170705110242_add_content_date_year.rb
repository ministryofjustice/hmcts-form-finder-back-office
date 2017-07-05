class AddContentDateYear < ActiveRecord::Migration
  def change
    add_column :documents, :content_date_year, :string, limit: 4
  end
end

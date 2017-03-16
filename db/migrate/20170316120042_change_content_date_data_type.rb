class ChangeContentDateDataType < ActiveRecord::Migration
  def change
    change_column :documents, :content_date, :string
  end
end

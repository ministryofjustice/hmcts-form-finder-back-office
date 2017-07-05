class RenameContentDateToMonth < ActiveRecord::Migration
  def change
    rename_column :documents, :content_date, :content_date_month
  end
end

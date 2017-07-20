class ChangeContentDateType < ActiveRecord::Migration
  def change
    change_column :documents, :content_date, :date
  end
end

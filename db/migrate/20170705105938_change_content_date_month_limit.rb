class ChangeContentDateMonthLimit < ActiveRecord::Migration
  def change
    change_column :documents, :content_date_month, :string, limit: 2
  end
end

class IncreaseSummaryLimit < ActiveRecord::Migration
  def change
    change_column :documents, :summary, :string, limit: 250
  end
end

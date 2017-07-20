class AddSummaryToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :summary, :string, limit: 250
  end
end

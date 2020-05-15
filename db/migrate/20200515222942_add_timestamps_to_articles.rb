class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  # function to add columns to a table that you have already migrated
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end

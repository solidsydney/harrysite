class AddUrlToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :url, :string
  end
end

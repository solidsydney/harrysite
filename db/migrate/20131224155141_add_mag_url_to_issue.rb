class AddMagUrlToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :mag_url, :string
  end
end

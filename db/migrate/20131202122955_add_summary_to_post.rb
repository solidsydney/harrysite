class AddSummaryToPost < ActiveRecord::Migration
  def change
    add_column :posts, :summary, :string
  end
end

class ChangeColumnTypeForPost < ActiveRecord::Migration
  def change
    change_column :posts, :summary, :text
  end
end

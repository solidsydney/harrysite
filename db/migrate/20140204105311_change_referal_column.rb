class ChangeReferalColumn < ActiveRecord::Migration
  def change
    change_column :impressions, :referrer, :text
  end
end

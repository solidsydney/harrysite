class AddHasAccountToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :has_account, :boolean, default: false
  end
end

class AddAncestryToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :ancestry, :string, index: true
  end
end

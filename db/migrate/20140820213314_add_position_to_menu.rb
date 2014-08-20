class AddPositionToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :position, :integer, default: 0
  end
end

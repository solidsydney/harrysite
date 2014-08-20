class AddCategoryToMenu < ActiveRecord::Migration
  def change
    add_reference :menus, :category, index: true
  end
end

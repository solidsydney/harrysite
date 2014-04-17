class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    Category.create([{name: "Beauty"}, {name: "Editorial"}, {name: "Entertainment"}, {name: "Fashion"}, {name: "Lookbook"},
                    {name: "News"}, {name: "Style"}, {name: "Catwalk"}])
  end
end

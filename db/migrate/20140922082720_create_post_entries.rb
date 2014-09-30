class CreatePostEntries < ActiveRecord::Migration
  def change
    create_table :post_entries do |t|
      t.string :title
      t.text :summary
      t.text :body
      t.string :name
      t.string :email
      t.boolean :active, default: false

      t.timestamps
    end
  end
end

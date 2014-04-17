class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.datetime :publish_on

      t.timestamps
    end
  end
end

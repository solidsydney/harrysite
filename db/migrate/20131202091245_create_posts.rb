class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_type
      t.string :title
      t.text :body
      t.string :video_url
      t.datetime :publish_on

      t.timestamps
    end
  end
end

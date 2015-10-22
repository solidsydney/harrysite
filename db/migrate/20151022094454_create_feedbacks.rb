class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :fullname
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
class AddAttachmentMagToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :mag
    end
  end

  def self.down
    drop_attached_file :issues, :mag
  end
end

class AddAttachmentEntryCoverToPostEntries < ActiveRecord::Migration
  def self.up
    change_table :post_entries do |t|
      t.attachment :entry_cover
    end
  end

  def self.down
    drop_attached_file :post_entries, :entry_cover
  end
end

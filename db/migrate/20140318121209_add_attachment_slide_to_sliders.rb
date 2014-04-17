class AddAttachmentSlideToSliders < ActiveRecord::Migration
  def self.up
    change_table :sliders do |t|
      t.attachment :slide
    end
  end

  def self.down
    drop_attached_file :sliders, :slide
  end
end

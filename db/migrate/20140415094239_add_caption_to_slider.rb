class AddCaptionToSlider < ActiveRecord::Migration
  def change
    add_column :sliders, :caption, :text
  end
end

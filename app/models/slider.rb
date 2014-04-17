class Slider < ActiveRecord::Base
  has_attached_file :slide, :styles => {:trend_small => "573x462#", :original => "800x800>"}
  validates_attachment_presence :slide
  validates_attachment_content_type :slide, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :slide
  validates  :url, :name, :presence => true
  scope :published, lambda { order(created_at: :desc) }
  scope :recent, -> {order(created_at: :desc)}
  validates :url, :format => URI::regexp(%w(http https))
end

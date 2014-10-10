class PostEntry < ActiveRecord::Base
  scope :published, -> {where(active: true).order(created_at: :desc)}
  scope :pending, -> {where(active: false).order(created_at: :desc)}
  validates :email, :summary, :body, :name, :title, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  has_attached_file :entry_cover,
                    :styles => {
                        :large => "800x800>",
                        :small => "170x150#",
                        :thumb => "396x324#",
                        :th_new => "270x280#",
                        :daily => "200x125#"
                    }

  validates_attachment_content_type :entry_cover, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :entry_cover, :less_than => 1.megabyte
  validates_attachment_presence :entry_cover
end


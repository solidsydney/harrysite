class PostEntry < ActiveRecord::Base
  scope :published, -> {where(active: true).order(created_at: :desc)}
end

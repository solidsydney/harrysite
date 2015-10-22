class Issue < ActiveRecord::Base
  has_attached_file :cover,
                    :styles => {
                        :large => "4000x4000>",
                        small: "520x645",
                        thumb: "212x263",
                        :th_new => "270x280#"
                    }
  validates_attachment_content_type :cover, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :cover, :less_than => 5.megabyte
  validates_attachment_presence :cover
  scope :active_slide, -> {where(active: true)}

  has_attached_file :mag
  #validates_attachment_presence :mag
  #validates_attachment_content_type :mag, :content_type => ['application/pdf']
  default_scope {order("created_at desc")}
end

class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }

  validates_attachment_size :data, :less_than => 2.megabytes
  do_not_validate_attachment_file_type :data
  validates_attachment_presence :data
  belongs_to :assetable, :polymorphic => true
  scope :recent, -> {order("RAND()")}

  def url_content
    url(:content)
  end
end

class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_attached_file :post_image,
                    :styles => {
                        :original => "800x800>"
                    }
  validates_attachment_content_type :post_image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :post_image, :less_than => 5.megabyte
  validates_attachment_presence :post_image

  validates :title, :summary, :presence => true
  scope :blog_posts, -> { where(post_type: "Blog") }
  scope :top_posts, -> { where(post_type: "Blog").order("impressions_count desc").limit(12) }
  scope :gallery_posts, -> { where(post_type: "Gallery")}
  scope :recent,  -> {order("created_at desc")}
  scope :front_video_posts, -> { where(post_type: "Video").limit(4) }
  belongs_to :user


  validates :title, :post_type, :presence => true
  validates :body, presence: true, if: :blog_post

  validates :video_url, presence: true, if: :video_post
  validates_length_of :summary, maximum: 500
  is_impressionable :counter_cache => { :column_name => :views_count, :unique => :all }

  def blog_post
    post_type == "Blog"
  end

  def video_post
    post_type == "Video"
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end


  def self.search_published(query, tag_id = nil)
    primitive_search(query)
  end

  def self.primitive_search(query, join = "AND")
    find(:all, :conditions => primitive_search_conditions(query, join))
  end

  def similar_stories_all
    self.class.limit(3).primitive_search(title, "OR")
  end

  def similar_stories
    primitive_search(title, "OR")
  end


  private

  def self.primitive_search_conditions(query, join)
    query.split(/\s+/).map do |word|
      '(' + %w[title].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(" #{join} ")
  end
end

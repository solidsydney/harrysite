# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://blanckdigital.com"

SitemapGenerator::Sitemap.create do



  add videos_path, :priority => 0.7, :changefreq => 'daily'
  add posts_path, :priority => 0.7, :changefreq => 'daily'
  add issues_path, :priority => 0.7, :changefreq => 'daily'
  add root_path, :priority => 0.7, :changefreq => 'daily'
  add "/submissions", :priority => 0.7, :changefreq => 'daily'

  #
  # Add all articles:
  #
  Post.blog_posts.find_each do |story|
    add post_path(story), :lastmod => story.updated_at
  end

  Post.video_posts.find_each do |story|
    add video_path(story), :lastmod => story.updated_at
  end

  Issue.find_each do |story|
    add issue_path(story), :lastmod => story.updated_at
  end

end

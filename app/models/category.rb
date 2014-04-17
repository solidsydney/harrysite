class Category < ActiveRecord::Base
  default_scope order: "name"
  has_and_belongs_to_many :posts

  def to_param
    "#{id}-#{name.parameterize}"
  end
end

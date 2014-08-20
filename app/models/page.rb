class Page < ActiveRecord::Base
  def to_param
    [id, title].compact.join("-").parameterize
  end
end

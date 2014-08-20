class Menu < ActiveRecord::Base
  has_ancestry
  belongs_to :category

  def display_name
    if is_root?
      "#{name}"" -root"
    else
      name
    end
  end
end

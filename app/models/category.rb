class Category < ActiveRecord::Base

  def add_parent_id         #function returns name for 'select' and gives parent id to new categories
    self.parent_id = id
    name
  end

end

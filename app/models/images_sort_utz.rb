class ImagesSortUtz < ActiveRecord::Base
  has_many :images_sort_utz_pictures

  def name
    theme
  end
end

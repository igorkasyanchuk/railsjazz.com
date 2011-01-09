class Project < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  
  belongs_to :project_category

  has_attached_file :image, 
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension"
                    :bucket => "railsjazz.com_#{Rails.env}"

  has_attached_file :preview_image
end
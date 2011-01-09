class Project < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :project_category_id
  
  belongs_to :project_category
  
  scope :featured, where(:featured => true)

  has_attached_file :image, 
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "railsjazz.com_#{Rails.env}",
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }

  has_attached_file :preview_image,
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "railsjazz.com_#{Rails.env}",
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
end
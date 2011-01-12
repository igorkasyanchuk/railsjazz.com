class Screenshot < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :description
  
  scope :by_priority, order('priority desc')

  has_attached_file :image, 
                    :storage => :s3,
                    :path => "screenshot/:attachment/:id/:style.:extension",
                    :bucket => "www.railsjazz.com_#{Rails.env}",
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }

end

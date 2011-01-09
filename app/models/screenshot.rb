class Screenshot < ActiveRecord::Base

  has_attached_file :image, 
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "railsjazz.com_#{Rails.env}",
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }

end

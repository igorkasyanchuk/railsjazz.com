class Project < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :project_category_id
  validates_presence_of :summary
  validates_presence_of :completed_on
  
  belongs_to :project_category
  has_many :screenshots, :dependent => :destroy
  
  has_friendly_id :title, :use_slug => true
  
  scope :featured, where(:featured => true)
  scope :web_design, where(:project_category_id => ProjectCategory.find_by_name("Web Design").id)
  scope :web_development, where(:project_category_id => ProjectCategory.find_by_name("Web Development").id)
  scope :latest, order('completed_on desc').limit(5)
  scope :by_priority, order('priority desc')

  has_attached_file :image, 
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "www.railsjazz.com_#{Rails.env}",
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }

  has_attached_file :preview_image,
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "www.railsjazz.com_#{Rails.env}",
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }
                    
  has_attached_file :portfolio_image,
                    :storage => :s3,
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "www.railsjazz.com_#{Rails.env}",
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    }                    
end
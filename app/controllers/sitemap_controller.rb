class SitemapController < ApplicationController
  
  def sitemap
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = Time.now.httpdate    
  end
  
end

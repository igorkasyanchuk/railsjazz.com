RailsjazzCom::Application.routes.draw do
  root :controller => 'home', :action => 'index'
  match "/sitemap.xml" , :controller => "sitemap", :action => "sitemap", :format => 'xml' 
end

RailsjazzCom::Application.routes.draw do
  root :controller => 'home', :action => 'index'
  
  match '/services' => 'home#services' 
  match '/portfolio' => 'home#portfolio' 
  match '/about' => 'home#about' 
  match '/blog' => 'home#blog' 
  match '/contact' => 'home#contact' 
  
  match "/sitemap.xml" , :controller => "sitemap", :action => "sitemap", :format => 'xml' 
end

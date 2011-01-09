RailsjazzCom::Application.routes.draw do
  root :controller => 'home', :action => 'index'
  
  match '/services' => 'home#services' 
  match '/portfolio' => 'home#portfolio' 
  match '/about' => 'home#about' 
  match '/blog' => 'home#blog' 
  match '/contact' => 'home#contact' 
  
  namespace :admin do
    match '/', :to => 'dashboard#welcome'
    resources :project_categories
    resources :contacts, :only => [:index, :destroy]
    resources :projects do
      resources :screenshots
    end
  end  

  match "/sitemap.xml" , :controller => "sitemap", :action => "sitemap", :format => 'xml' 
end

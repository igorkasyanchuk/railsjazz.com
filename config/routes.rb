RailsjazzCom::Application.routes.draw do
  root :controller => 'home', :action => 'index'
  
  match '/services' => 'home#services' 
  match '/portfolio' => 'home#portfolio' 
  match '/about' => 'home#about' 
  match '/blog' => 'home#blog' 
  
  namespace :admin do
    match '/', :to => 'dashboard#welcome'
    resources :project_categories
    resources :contacts, :only => [:index, :destroy]
    resources :projects do
      resources :screenshots
    end
  end
  
  resources :projects, :only => [:show, :index]
  resources :contacts, :only => [:new, :create, :index, :show]   

  match "/sitemap.xml" , :controller => "sitemap", :action => "sitemap", :format => 'xml' 
end

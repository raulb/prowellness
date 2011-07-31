Prowellness::Application.routes.draw do
  root :to => redirect("/login")

  get   '/login'  => 'sessions#new',     :as => :login
  get   '/logout' => 'sessions#destroy', :as => :logout
  match '/sessions/create' => 'sessions#create', :as => :create_session
  
  namespace :admin do
    resources :posts, :except => [:show]
  end
  
  resources :posts, :only => [:show]

end

Prowellness::Application.routes.draw do
  root :to => 'site#home'

  get   '/login'  => 'sessions#new',     :as => :login
  get   '/logout' => 'sessions#destroy', :as => :logout
  match '/sessions/create' => 'sessions#create', :as => :create_session

  namespace :admin do
    resources :posts, :except => [:show]
  end

  get '/sobre-prowellness'           => 'site#about',               :as => :about
  get '/editorial'                   => 'books#index',              :as => :books
  get '/galeria-imagenes'            => 'images#index',             :as => :images
  get '/articulos'                   => 'articles#index',           :as => :articles
  get '/articulos/:category'         => 'articles#index',           :as => :articles_category
  get '/articulos/*categories/:slug' => 'articles#show',            :as => :article
  get '/guia-visual'                 => 'visual_guide_posts#index', :as => :visual_guide
  get '/guia-visual/:category'       => 'visual_guide_posts#index', :as => :visual_guide_category
  get '/guia-visual/*categories/:slug' => 'visual_guide_posts#show',  :as => :visual_guide_post
  get '/blog'                        => 'blog_posts#index',         :as => :blog
  get '/blog/:slug'                  => 'blog_posts#show',          :as => :blog_post

end

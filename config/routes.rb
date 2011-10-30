Prowellness::Application.routes.draw do
  root :to => 'site#home'

  get   '/logout' => 'sessions#destroy', :as => :logout
  match '/sessions/create' => 'sessions#create', :as => :create_session

  get '/confirm/:confirmation_token' => 'users#confirm', :as => :confirm_account
  resource :user, :only => [:edit, :update]
  resource :users, :only => [:new, :create]

  namespace :admin do
    root :to => redirect("/admin/posts")
    resources :posts, :except => [:show]
    resources :books, :only => [:index] do
      resources :book_videos
    end
  end

  get '/sobre-prowellness'             => 'site#about',               :as => :about
  get '/editorial'                     => 'books#index',              :as => :books
  get '/libros/:id'                    => 'books#show',               :as => :buy_book
  post '/libros/:id/comprar'           => 'books#buy',                :as => :submit_buy_book
  get '/galeria-imagenes'              => 'images#index',             :as => :images
  get '/articulos'                     => 'articles#index',           :as => :articles
  get '/articulos/fitness/ejercicio-del-mes' => 'articles#month_exercises',    :as => :month_exercises
  get '/articulos/:category'           => 'articles#index',           :as => :articles_category
  get '/articulos/*categories/:slug'   => 'articles#show',            :as => :article
  get '/guia-visual'                   => 'visual_guide_posts#index', :as => :visual_guide
  get  '/guia-visual/editorial'         => 'book_videos#index',        :as => :visual_guide_editorial
  post '/guia-visual/editorial/video'   => 'book_videos#show',         :as => :visual_guide_editorial_video
  get '/guia-visual/:category'         => 'visual_guide_posts#index', :as => :visual_guide_category
  get '/guia-visual/*categories/:slug' => 'visual_guide_posts#show',  :as => :visual_guide_post
  get '/blog'                          => 'blog_posts#index',         :as => :blog
  get '/blog/:slug'                    => 'blog_posts#show',          :as => :blog_post

  get "buscar" => "search#index", :as => :search

  resources :comments
  resources :attachments

  # Preview email routes
  if Rails.env.development?
    mount UserMailer::Preview => 'mail_view/user_mailer'
  end
end

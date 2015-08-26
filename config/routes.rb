Rails.application.routes.draw do

  devise_scope :user do
    # make some pretty URLs

    get "users/sign_in" => "sessions#new"
    get "users/sign_out" => "sessions#destroy"
    get "users/current_user" => "sessions#get_current_user"
    get "users/dashboard_data" => "users#dashboard_data"

    # rewrite the registrations URLs so they don't collide with my custom Users Controller
    get "signup" => "devise/registrations#new", :as => :new_user_registration
    put "update-registration" => "devise/registrations#update", :as => :update_user_registration
    delete "delete-registration" => "devise/registrations#destroy", :as => :delete_user_registration
    get "edit-registration" => "devise/registrations#edit", :as => :edit_user_registration
    get "cancel-registration" => "devise/registrations#cancel", :as => :cancel_user_registration
    post "create-registration" => "devise/registrations#create", :as => :user_registration
  end

  devise_for :users, controllers: { sessions: "sessions" }

  resources :users
  resources :podcasts
  resources :posts
  resources :comments

	get 'get_podcasts' => 'podcasts#get_podcasts'
  get 'find_podcast' => 'podcasts#find_podcast'
  get 'update_podcast' => 'podcasts#update_podcast'
  get 'create_podcast_comment' => 'podcasts#create_podcast_comment'

  get 'meet_the_hosts' => 'users#meet_the_hosts'
  get 'contact_pshq' => 'users#contact_pshq'
  get 'about_pshq' => 'users#about_pshq'

  get 'get_posts' => 'posts#get_posts'
  get 'find_post' => 'posts#find_post'
  get 'update_post' => 'posts#update_post'
  get 'create_post_comment' => 'posts#create_post_comment'
  get 'create_post' => 'posts#create_post'

  root :to => 'podcasts#welcome'

end

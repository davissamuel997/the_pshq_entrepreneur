Rails.application.routes.draw do

  devise_for :users
	get 'get_podcasts' => 'podcasts#get_podcasts'

  root :to => 'podcasts#welcome'

end

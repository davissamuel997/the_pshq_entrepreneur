Rails.application.routes.draw do

	get 'get_podcasts' => 'podcasts#get_podcasts'

  root :to => 'podcasts#welcome'

end

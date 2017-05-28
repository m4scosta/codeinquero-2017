Rails.application.routes.draw do
  root 'welcome#index'

  get 'eventos'              => 'home#index', as: :home
  get 'dashboard'            => 'dashboard#show'
  get '/auth/auth0/callback' => 'auth0#callback', as: :auth_callback
  get '/auth/failure'        => 'auth0#failure'

  post '/quests'             => 'quest#create'
  post '/quest_rewards'      => 'quest_reward#create'
  post '/user_rewards'       => 'user_reward#create'

  get '/resgate'             => 'prize#index', as: :prize_index
  post '/arquivar-premio'	 => 'prize#archive', as: :archive_prize
  post '/novo-premio'		 => 'prize#create', as: :new_prize
end
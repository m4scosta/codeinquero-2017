Rails.application.routes.draw do
  root 'welcome#index'

  post '/identificacao'      => 'welcome#log_in'
  get '/saida'               => 'welcome#logout', as: :logout

  get '/eventos'             => 'home#index', as: :home
  post '/quests'             => 'quest#create'
  post '/quest_rewards'      => 'quest_reward#create'
  post '/user_rewards'       => 'user_reward#create'

  get '/resgate'             => 'prize#index', as: :prize_index
  post '/arquivar-premio'    => 'prize#archive', as: :archive_prize # for admins
  post '/escolher-premio'    => 'prize#choose', as: :choose_prize

  get '/ranking'             => 'ranking#index', as: :ranking
end
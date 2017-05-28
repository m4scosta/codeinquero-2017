Rails.application.routes.draw do
  root 'welcome#index'
  get 'dashboard' => 'dashboard#show'
  get '/auth/auth0/callback' => 'auth0#callback', as: :auth_callback
  get '/auth/failure'        => 'auth0#failure'
end
Rails.application.routes.draw do
 
  root 'events#index' 
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :show, :new, :create]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end

Rails.application.routes.draw do
  resources :users
  resources :ways
  resources :stations
  get 'api/last_train' => 'last_train#get_last_train'
  root 'welcome#index'
end

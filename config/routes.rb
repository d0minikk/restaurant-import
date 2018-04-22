Rails.application.routes.draw do
  resources :import_tasks, only: [:index, :new, :create]
  resources :dishes, only: [:index]
  resources :menus, only: [:index, :show]

  resources :sponsors, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :venues, only: [:index, :show]
  resources :places, only: [:index, :show]
  resources :occasions, only: [:index, :show]
  resources :locations, only: [:index, :show]

  root to: 'import_tasks#index'
end

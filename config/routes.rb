Rails.application.routes.draw do
  resources :import_tasks, only: [:index, :new, :create]

  root to: 'import_tasks#index'
end

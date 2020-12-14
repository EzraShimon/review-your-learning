Rails.application.routes.draw do
  resources :users, shallow: true do
    resources :learnings
  end
  resources :sessions
  
  root to: 'sessions#new'
end

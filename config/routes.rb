Rails.application.routes.draw do
  devise_for :users
  resources :keystroke_sessions, only: %i[index new create show]
  root "keystroke_sessions#new"
end

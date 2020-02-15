Rails.application.routes.draw do
  resources :keystroke_sessions
  root "keystroke_sessions#new"
end

Rails.application.routes.draw do
  resources :keystroke_sessions, only: %i[index new create show]
  root "keystroke_sessions#new"
end

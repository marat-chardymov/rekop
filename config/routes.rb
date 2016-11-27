Rails.application.routes.draw do
  root "welcome#start"

  post '/signup', to: "registrations#create"

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chatrooms, param: :topic
  resources :messages
end

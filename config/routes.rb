Rails.application.routes.draw do
  get 'static/home'
  root "static#home"
  get "/users",to: "users#index"
  post "/users",to: "users#create"
  delete "/users/:id",to: "users#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

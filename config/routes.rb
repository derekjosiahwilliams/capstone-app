Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "users#home"

  get "/arts" => "arts#upload"
  post "/arts" => "arts#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "accounts#new"
  post "/login" => "accounts#create"
  get "/logout" => "accounts#destroy"
end

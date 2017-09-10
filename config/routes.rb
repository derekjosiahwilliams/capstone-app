
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "users#home"

  get "/arts" => "arts#upload"
  get "/arts/draw" => "arts#draw"
  get "/arts/:id" => "arts#show"
  post "/arts" => "arts#create"
  delete "/users/:id" => "users#destory"


  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "accounts#new"
  post "/login" => "accounts#create"
  get "/logout" => "accounts#destroy"
end

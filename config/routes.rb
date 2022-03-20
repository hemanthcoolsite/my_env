Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'dash_board#index' 
  get  "dash_board/search"
  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  root to: "home#welcome"
  get '/login_screen', to: "home#login_screen"
  post '/redirecting', to: "home#redirecting"
  post '/login', to: "home#login"
  get '/logout', to: "home#logout"
  post 'job_listings/fill_position/:id',to: "job_listings#fill_position", as:"fill_position"
  resources :job_applications
  resources :job_listings
  resources :hiring_managers
  resources :job_seekers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

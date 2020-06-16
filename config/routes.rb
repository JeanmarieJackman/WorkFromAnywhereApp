Rails.application.routes.draw do
  get '/', to: "home#welcome"
  get '/sign_in', to: "home#sign_in"
  get '/sign_out', to: "home#sign_out"
  resources :job_applications
  resources :job_listings
  resources :hiring_managers
  resources :job_seekers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

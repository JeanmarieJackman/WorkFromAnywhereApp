Rails.application.routes.draw do
  resources :job_applications
  resources :job_listings
  resources :hiring_managers
  resources :job_seekers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

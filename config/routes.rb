Rails.application.routes.draw do
  root 'stops#index'
  resources :routes
  resources :stops do
    get :search, :on => :collection
  end
  patch 'routes/plot', to: 'routes#plot'
  post 'routes/plot', to: 'routes#plot'
  post 'stops/plot', to: 'stops#plot', as: 'plot'
end

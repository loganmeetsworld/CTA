Rails.application.routes.draw do
  root 'stops#index'
  get '/map', to: 'stops#map'
  get '/table', to: 'stops#table'
end

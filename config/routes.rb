Gmaps::Application.routes.draw do
  get 'investigators/index'

  resources :cars

  root 'cars#index'
  get  'nonauth'    => 'cars#nonauthorised'
  get  'update_map' => 'cars#update_map'
end

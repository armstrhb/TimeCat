Rails.application.routes.draw do
  root 'universes#index'

  get '/:name', to: 'universes#show', as: :universe_detail

  get '/:name/locations', to: 'locations#index', as: :locations_index
  get '/locations/drill/:id', to: 'locations#drill', as: :location_drill
  get '/locations/climb/:id', to: 'locations#drill', as: :location_climb
  get '/:name/locations/:location', to: 'locations#show', as: :location_show
  post '/:name/locations/search', to: 'locations#search', as: :location_search
  get '/:universe/locations/:location/description', to: 'locations#description', as: :location_description
  post '/:universe/locations/:location/description', to: 'locations#update_description', as: :location_update_description
  post '/locations/create', to: 'locations#create', as: :location_create

  get '/:name/people', to: 'people#index', as: :people_index
  get '/:name/description', to: 'universes#description', as: :universe_description
  post '/:name/description', to: 'universes#update_description', as: :universe_update_description

  get '/:universe/events', to: 'events#index', as: :events_index
  get '/:universe/events/:name', to: 'events#show', as: :event_show
end

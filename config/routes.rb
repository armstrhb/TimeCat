Rails.application.routes.draw do
  root 'universes#index'

  get '/:name', to: 'universes#show', as: :universe_detail
  get '/:name/places', to: 'places#index', as: :places_index
  get '/:name/people', to: 'people#index', as: :people_index
end

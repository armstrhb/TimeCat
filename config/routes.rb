Rails.application.routes.draw do
  root 'universes#index'

  get '/:name', to: 'universes#show', as: :universe_detail
  get '/:name/locations', to: 'locations#index', as: :locations_index
  get '/:name/people', to: 'people#index', as: :people_index
  get '/:name/description', to: 'universes#description', as: :universe_description
  post '/:name/description', to: 'universes#update_description', as: :universe_update_description
end

Rails.application.routes.draw do
  get '/timelines', to: 'timelines#index', as: :timelines
  get '/timelines/:name', to: 'timelines#show', as: :timeline_detail
end

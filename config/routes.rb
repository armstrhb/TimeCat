Rails.application.routes.draw do
  get '/timeline', to: 'timelines#index'
  get '/timeline/:name', to: 'timelines#show'
end

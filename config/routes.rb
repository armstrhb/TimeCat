Rails.application.routes.draw do
  get '/timelines', to: 'timelines#index'
  get '/timelines/:name', to: 'timelines#show'
end

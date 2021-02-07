Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  get '/smithsonian', to: 'smithsonian#index'

  get '/smithsonian/lookup', to: 'smithsonian#itemLookup'

  get '/smithsonian/item', to: 'smithsonian#itemLink'

  get '/themet', to: 'application#index'

end

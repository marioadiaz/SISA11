Rails.application.routes.draw do

root 'pages#home'


devise_for :users
devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
 get '/pages/home', to: 'pages#home'
  #CLIENTES
  get '/clientes', to: 'clientes#index'
  get 'clientes/new', to: 'clientes#new'
  post '/clientes', to: 'clientes#create'

  get '/cliente/:id', to: 'clientes#show', as: 'cliente'
  get '/clientes/:id/edit', to: 'clientes#edit', as: 'edit_cliente'
  patch '/cliente/:id', to: 'clientes#update'
  put '/cliente/:id', to: 'clientes#update'
  delete '/cliente/:id', to: 'clientes#delete'

  #TECNICOS
  get '/tecnicos', to: 'tecnicos#index'
  get 'tecnicos/new', to: 'tecnicos#new'
  post '/tecnicos', to: 'tecnicos#create'
  get '/tecnico/:id', to: 'tecnicos#show', as: 'tecnico'
  get '/tecnicos/:id/edit', to: 'tecnicos#edit', as: 'edit_tecnico'
  patch '/tecnico/:id', to: 'tecnicos#update'
  put '/tecnico/:id', to: 'tecnicos#update'
  delete '/tecnico/:id', to: 'tecnicos#delete'

  #ORDEN FUMIGACION
  get '/orden_fumigacions', to: 'orden_fumigacions#index'

  get 'orden_fumigacions/new', to: 'orden_fumigacions#new'
  post '/orden_fumigacions', to: 'orden_fumigacions#create'

  get '/orden_fumigacion/:id', to: 'orden_fumigacions#show', as: 'orden_fumigacion'

  get '/orden_fumigacions/:id/edit', to: 'orden_fumigacions#edit', as: 'edit_orden_fumigacion'
  patch '/orden_fumigacion/:id', to: 'orden_fumigacions#update'
  put '/orden_fumigacion/:id', to: 'orden_fumigacions#update'
  delete '/orden_fumigacion/:id', to: 'orden_fumigacions#delete'


  get 'buscador_clientes/:termino', to: 'clientes#buscador'
  post '/add_cliente_orden_fumigacion/', to: 'orden_fumigacions#add_cliente'
  get 'buscador_tecnicos/:termino', to: 'tecnicos#buscador'
  post '/add_tecnico_orden_fumigacion/', to: 'orden_fumigacions#add_tecnico'

  #QUEJAS
  get '/quejas', to: 'quejas#index'
  get 'quejas/new', to: 'quejas#new'
  post '/quejas', to: 'quejas#create'
  get '/queja/:id', to: 'quejas#show', as: 'queja'
  get '/quejas/:id/edit', to: 'quejas#edit', as: 'edit_queja'
  patch '/queja/:id', to: 'quejas#update'
  put '/queja/:id', to: 'quejas#update'
  delete '/queja/:id', to: 'quejas#delete'

end

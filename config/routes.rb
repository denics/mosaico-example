Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Mosaico::Engine => '/mosaico'
end

Mosaico::Engine.routes.draw do
  resources :projects
  get '/projects/:template_name/new', to: 'projects#new'

  resources :templates, param: :template_name, only: [:show]

  scope :images, as: :mosaico_image do
    get '/(:id)', to: 'images#show'
    post '/', to: 'images#create'
    delete '/:id', to: 'images#destroy'
  end
end
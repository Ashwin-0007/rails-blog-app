Rails.application.routes.draw do
  devise_for :users, controllers: {sessions:'users/sessions', registrations:'users/registrations' }
  root 'blogpages#index'

  # get 'blogpages', to: 'blogpages#index'

  # get 'blogpages/new', to: 'blogpages#new'

  # post 'blogpages', to: 'blogpages#create'

  # get 'blogpages/:id/show', to: 'blogpages#show', as: 'blogpage'

  # get 'blogpages/:id/edit', to: 'blogpages#edit', as: 'blogpage_edit'

  # patch '/blogpages/:id', to: 'blogpages#update'
  
  # delete 'blogpages', to: 'blogpages#destroy'

  resources :blogpages do
    resources :comments
  end

  get '/user_blog', to: 'blogpages#user_blog', as: 'user_blog'

end

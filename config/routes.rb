Rails.application.routes.draw do
  resources :books
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'main#index'
  get 'main/abou_us'
end

Rails.application.routes.draw do

  #Books Routes
  resources :books, :except => [:index, :delete] do
    collection do
      post :search
    end
  end
  get 'library', :to => 'books#index'
  

  #Devise Routes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'main#index'
  get 'main/abouts_us'
end

Rails.application.routes.draw do

  #Books Routes
  resources :books, :except => [:index, :delete] do
    collection do
      post :search
      post :add_book_to_user
      delete :remove_book_from_user
    end
  end
  get 'library', :to => 'books#index'
  

  #Devise Routes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'main#index'
  get 'main/abouts_us'
end

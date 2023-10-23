Rails.application.routes.draw do
  #Books Routes
  resources :books, :except => [:index, :delete] do
    collection do
      post :search
      post :add_book_to_user
      get :add_book_to_database
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

  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
    get '/admin/dashboard' => 'admin_actions#dashboard'
    
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
  root 'main#index'
  get 'main/abouts_us'
end

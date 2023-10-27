Rails.application.routes.draw do
  
  root 'main#index'
  get 'main/abouts_us'

  #error routes
  match "/404", to: "errors#page_not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  
  #Books Routes
  get 'library', :to => 'books#index'
  resources :books, :except => [:index, :delete] do
    collection do
      post :search
      post :add_book_to_user
      get :add_book_to_database
      delete :remove_book_from_user
    end
  end
  

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

  devise_for :meeting_places, controllers: {
    sessions: 'meeting_place/sessions'
  }
end

Rails.application.routes.draw do
  
  resources :creating_meeting_place_requests
  
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
    get '/admin/user_list' => 'admin_actions#user_list'
    get '/admin/user_meeting_place_requests' => 'admin_actions#meeting_place_request_list', as: "admin_MPR"
    post '/admin/ban/:id', to: 'admin_actions#ban_user', as: 'lock_user'
    post '/admin/unban/:id', to: 'admin_actions#unban_user', as: 'unlock_user'

  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :meeting_places, controllers: {
    sessions: 'meeting_place/sessions'
  }
end

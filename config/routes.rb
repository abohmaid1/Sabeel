Rails.application.routes.draw do
  resources :change_user_type_requests
  resources :book_requests
  
  resources :creating_meeting_place_requests
  
  root 'main#index'
  get 'main/abouts_us'

  #error routes
  match "/404", to: "errors#page_not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  
  #Books Routes
  get 'library', :to => 'books#index'
  get 'exchange_library', :to => 'books#exchange_library'
  get 'check_requests', :to => 'book_requests#arrived_book_request', :as => "show_request"
  post 'accepted_request', :to => 'book_requests#accept_meeting', :as => "accepted_meeting"
  get 'rejected_request', :to => 'book_requests#reject_meeting', :as => "rejected_meeting"
  get 'requests_archive', :to => 'book_requests#requests_archive', :as => "requests_archive"
  get 'presence/update'
  


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
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'

  }


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :meeting_place do
    get '/meeting_places/sign_out' => 'devise/sessions#destroy'
    get '/meeting_places/index' => 'meeting_places#Main'
    patch '/meeting_places/presence/updateFirstSide', to: 'presence#updateFirstSide'
    patch '/meeting_places/presence/updateSecondSide', to: 'presence#updateSecondSide'

  end

  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
    get '/admin/dashboard' => 'admin_actions#dashboard'
    get '/admin/user_list' => 'admin_actions#user_list'

    get '/admin/meeting_place_requests' => 'admin_actions#meeting_place_request_list', as: "admin_MPR"
    get '/admin/change_user_type_requests' => 'admin_actions#change_user_type_requests', as: "admin_CUTR"

    post '/admin/ban/:id', to: 'admin_actions#ban_user', as: 'lock_user'
    post '/admin/unban/:id', to: 'admin_actions#unban_user', as: 'unlock_user'

    post '/admin/createMP/:id', to: 'admin_actions#create_meeting_place_profile', as: 'CreateMP'
    post '/admin/changeUT/:id', to: 'admin_actions#change_user_type', as: 'changeUT'

    post '/admin/rejectMP/:id', to: 'admin_actions#reject_meeting_request', as: 'rejectMP'
    post '/admin/rejectUT/:id', to: 'admin_actions#reject_user_request', as: 'rejectUT'
  end
  # authenticated :meeting_place do
  #   root to: "home#index"
  # end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :meeting_place, controllers: {
    sessions: 'meeting_place/sessions'
  }
end

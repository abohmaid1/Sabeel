Rails.application.routes.draw do
  devise_for :users
  root 'main#index'
  get 'main/abou_us'
end

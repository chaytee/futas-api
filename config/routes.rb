Rails.application.routes.draw do

  #current_user機能の追加
  devise_for :users

  namespace :api do

    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/auth/registrations'
    }
    #api/users
    namespace :users do
      resources :relationships, only: [:create, :index]
      resources :tasks
      resources :messages
      resource :dashbord, only: [:show]
    end

    resources :user, only: [:index, :show]
  end

end
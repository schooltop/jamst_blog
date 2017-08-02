Rails.application.routes.draw do
  resources :blogs, only: [:index, :show] do
    collection do
      get :top_search
    end
  end
  resources :pictures, only: [:index]
  namespace :admin do
    root to: 'employees#index'
    resources :users
    resources :categories
    resources :tags
    resources :employees do
      collection do
        get  :forget_password
        post :forget_password
        get  :reset_mail
        get  :error_mail
      end
    end
    resources :articles do
      collection do
        post :upload_image
      end
    end
    resources :pictures do
      collection do
        post :upload_image
      end
    end
  end

  devise_for :employees, path: "admin", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "admin/sessions", passwords: "admin/passwords"}
  devise_for :users, controllers: { sessions: "web/sessions", registrations: "web/registrations", passwords: "web/passwords" }
  
  root to: 'blogs#index'

end

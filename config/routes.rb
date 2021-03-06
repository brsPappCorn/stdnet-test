Rails.application.routes.draw do
  resources :notification_posts
  # =========================
  # Root
  # =========================
  root to: 'static_pages#index'

  # =========================
  # Devise
  # =========================
  devise_for :users, path: '', path_names: {
      sign_in: 'ingreso', sign_up: 'registro'
  }, controllers: {
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
  }

  devise_for :administrators, path: '', path_names: {
      sign_in: 'ingreso_admin'
  }
  # =========================
  # Resources
  # =========================
  resources :administrators do
    collection do
      get 'opportunities'
      get 'pending_opportunities'
      post 'download_excel'
    end
  end

  resources :companies, only: [:show, :index]
  resources :people, only: [:show, :index]
  resources :students, only: [:show, :index] do
    member do
      post 'delete_second_major'
    end
  end

  resources :users, except: [:new, :create, :show] do
    member do
      post 'build_learnt_language'
      post 'mark_as_selected'
      post 'rate_opportunity'
    end
  end

  resources :opportunities do
    member do
      get 'application_form'
      post 'apply'
      get 'applicants'
      post 'approve'
      post 'close'
      post 'acquire_information'
    end
    collection do
      get 'my_opportunities'
    end
  end

  # =========================
  # Controllers
  # =========================
  # get '/about', to: 'static_pages#about'
  get '/admin_panel', to: 'administrators#index'
  get '/company_pricing', to: 'static_pages#pricing'
  # get "/payment_page", :to => "companies#payment_page", :as => "payment_page"
  get "/payment_response_page", :to => "companies#payment_response_page", :as => "payment_response_page"
  post "/payment_confirmation_page", :to => "companies#payment_confirmation_page", :as => "payment_confirmation_page"

  # ============
  # Mailer
  # ============
  # match '/contacto', to: 'Contacts#new', via: :get
  # match '/contacto', to: 'Contacts#create', via: :post
end

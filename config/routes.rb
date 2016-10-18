Rails.application.routes.draw do
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
      registrations: 'users/registrations'
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
    end
  end
  resources :companies
  resources :people
  resources :students
  resources :users

  resources :opportunities do
    member do
      get 'application_form'
      post 'apply'
      get 'applicants'
      post 'approve'
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


  # ============
  # Mailer
  # ============
  # match '/contacto', to: 'Contacts#new', via: :get
  # match '/contacto', to: 'Contacts#create', via: :post
end

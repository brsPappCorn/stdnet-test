Rails.application.routes.draw do


  # =========================
  # Root
  # =========================
  root to: 'static_pages#index'
  # TODO: Make root point to Student, Company or User /show, depending on user role

  # =========================
  # Devise
  # =========================
  devise_for :users, path: '', path_names: {
      sign_in: 'ingreso', sign_up: 'registro'
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
  resources :users do
    member do
      get 'basic_info'
    end
  end
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


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

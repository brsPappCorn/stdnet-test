Rails.application.routes.draw do


  # =========================
  # Root
  # =========================
  root to: 'static_pages#index'

  # =========================
  # Devise
  # =========================
  devise_for :user, path: '', path_names: {
      sign_in: 'ingreso', sign_up: 'registro'
  }, controllers: {
      registrations: 'users/registrations'
  }

  # =========================
  # Resources
  # =========================
  resources :administrators
  resources :companies
  resources :people
  resources :students
  resources :users

  # =========================
  # Controllers
  # =========================
  # get '/about', to: 'static_pages#about'
  get '/admin_panel', to: 'administrators#index'
  get '/info_basica', to: 'users#basic_info'


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

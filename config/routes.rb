Rails.application.routes.draw do



  # ============
  # Root
  # ============
  root to: 'static_pages#index'


  # ============
  # Devise
  # ============
=begin
  devise_for :administrators, controllers: {
      sessions: 'devise/sessions',
      devise_registration: 'devise/'
  }
=end

  # =========================
  # Devise
  # =========================
  devise_for :administrators
  devise_scope :administrator do
    get '/admin_ingreso', to: 'administrators/sessions#new'
    get '/admin_registro', to: 'administrators/registrations#new'
  end


=begin

  # Devise
  devise_for :admin, path_names: { sign_in: 'iniciar_sesion', sign_out: 'cerrar_sesion' }

  resources :historias, controller: 'stories', as: 'stories', path_names: { new: 'crear', edit: 'editar' }
  resources :usuarios, controller: 'users', as: 'users', path_names: { new: 'crear', edit: 'editar' } do
    resources :perimetros, controller: 'perimeters', as: 'perimeters', path_names: { new: 'crear' }, except: [:index, :edit, :update]
    resources :pliegues, controller: 'folds', as: 'folds', path_names: { new: 'crear' }, except: [:index, :edit, :update]
    resources :resultados, controller: 'results', as: 'results', only: [:show, :destroy]
  end

=end

  # ============
  # Controllers
  # ============
  # get '/about', to: 'static_pages#about'
  get 'admin_panel', to: 'administrators#index'


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

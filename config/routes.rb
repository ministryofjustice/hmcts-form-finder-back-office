Rails.application.routes.draw do
  get 'ping'        =>  'ping#index'
  get 'healthcheck' =>  'health_check#index'

  scope '(:locale)', locale: /en|cy/ do
    get 'edit_selected_document'  =>  'documents#edit_selected_document'
    get 'search'                  =>  'search#index'
    get 'search/search'           =>  'search#search'
    get 'search/results'          =>  'search#results'
    get 'search/show'             =>  'search#show'

    resources :doc_attachment_types
    resources :languages

    devise_for :users
    resources :users

    authenticated :user do
      root to: 'redirect_urls#index', as: :authenticated_root
    end

    resources :documents
    resources :document_categories
    resources :categories
    resources :redirect_urls

    get 'link/documents/disconnect' =>  'documents#disconnect'
    get 'link/documents/connect'    =>  'documents#connect'
    get 'link/documents/link'       =>  'documents#link'

    get 'assign/document_categories/assigns'  =>  'document_categories#assigns'
    get 'assign/document_categories/unassign' =>  'document_categories#unassign'

    root to: redirect('/users/sign_in')
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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

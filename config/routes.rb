Rails.application.routes.draw do
  get 'notification/index'

  get 'notification/new'

  get 'notification/create'

  get 'notification/edit'

  get 'notification/update'

  get 'notification/destroy'

  get 'notification/show'

  get 'answer/index'

  get 'answer/new'

  get 'answer/create'

  get 'answer/edit'

  get 'answer/update'

  get 'answer/destroy'

  get 'answer/show'

  get 'topic/index'

  get 'topic/new'

  get 'topic/create'

  get 'topic/edit'

  get 'topic/update'

  get 'topic/destroy'

  get 'topic/show'

  get 'question/index'

  get 'question/new'

  get 'question/create'

  get 'question/edit'

  get 'question/update'

  get 'question/destroy'

  get 'question/show'

  get 'subscription/index'

  get 'subscription/new'

  get 'subscription/create'

  get 'subscription/edit'

  get 'subscription/update'

  get 'subscription/destroy'

  get 'subscription/show'

  get 'event/index'

  get 'event/new'

  get 'event/create'

  get 'event/edit'

  get 'event/update'

  get 'event/destroy'

  get 'event/show'

  get 'classroom/index'

  get 'classroom/new'

  get 'classroom/create'

  get 'classroom/edit'

  get 'classroom/update'

  get 'classroom/destroy'

  get 'classroom/show'

  get 'registration/index'

  get 'registration/new'

  get 'registration/create'

  get 'registration/edit'

  get 'registration/update'

  get 'registration/destroy'

  get 'registration/show'

  get 'user/index'

  get 'user/new'

  get 'user/create'

  get 'user/edit'

  get 'user/update'

  get 'user/destroy'

  get 'user/show'

  root 'user#index'
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

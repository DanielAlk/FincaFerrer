Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  get 'admin' => 'admins#index'
  get 'admin/list' => 'admins#list'
  match 'admin' => 'admins#destroy', via: :delete
  devise_for :admins, controllers: { 
    registrations: 'admins/registrations', 
    sessions: 'admins/sessions', 
    passwords: 'admins/passwords'
  }

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  get 'winery' => 'pages#about', as: :about
  get 'products' => 'pages#branches', as: :branches_page
  get 'products/:branch_id' => 'pages#products', as: :products_page
  get 'news' => 'pages#news', as: :news
  get 'news/:article_id' => 'pages#news_article', as: :news_article
  get 'awards' => 'pages#awards', as: :awards
  get 'contact' => 'pages#contact', as: :contact_page

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  scope 'admin/' do
    resources :branches, :products, :subscribers, :articles, :contacts
  end

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

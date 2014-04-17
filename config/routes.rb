require 'sidekiq/web'
Franka::Application.routes.draw do
  get "categories/show"
  get "videos/index"
  get "welcome/index"
  get "contacts/index"
  mount Ckeditor::Engine => '/ckeditor'
  get "issues/index"
  get "issues/new"
  get "issues/edit"
  get "issues/show"
  get "posts/index"
  get "posts/new"
  get "posts/edit"
  get "posts/show"
  get 'submissions' => "welcome#submissions", as: :submissions
  post "mail_connector" => "contacts#mail_chimp_email", as: :mail_connector
  resources :contacts, only: [:create]
  resources :categories, only: [:show]
  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

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
  # end

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
     namespace :manage do
       root 'dashboard#index'
       resources :posts
       resources :categories
       resources :issues do
         member do
           get 'show_pdf'
           post 'deactivate'
         end
       end
       resources :users
       resources :sliders
       resources :contact_imports
       resources :contacts
       resources :news_letters do
         member do
           post 'send_now'
         end
       end
       #resources :products
     end

  resources :issues do
    member do
      get 'show_pdf'
    end
  end

  get "unsubscribe/:email" => "contacts#unsubscribe_mail_chimp_email", as: :unsubscribe

  get "/search" => "welcome#search", as: :search
  resources :posts
  resources :videos
  mount Sidekiq::Web, at: "/sidekiq"
end

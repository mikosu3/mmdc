Rails.application.routes.draw do
  get 'home/index'

  resources :authors, :except => [:show]
  resources :wanteds, :except => [:show, :delete]
  resources :emms, :except => [:edit, :delete] do
    collection do
      get 'video/:video_id' => "emms#index", as: "video"
    end
  end
  resources :videos, :except => [:show] do
    member do
      get 'zip'
    end
    collection do
      delete 'destroy_all'
    end
  end
  resources :infos
  resources :credits, :except => [:show, :delete] do
    collection do
      get "/new/:wanted_id" => "credits#new", as: "add"
      get :autocomplete_author_name
    end
  end

  resources :users, :except => [:create, :show]

  resources :ranks, :except => [:show, :delete, :create]

  root 'home#index'
  get "home/index"

  get '/auth/:provider/callback', :to => 'sessions#callback'
  post '/auth/:provider/callback', :to => 'sessions#callback'
  get '/logout' => 'sessions#destroy', :as => :logout

#  resources :credits do
#    get "/new/:wanted_id" => "credits#new", as: "add"
#  end

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

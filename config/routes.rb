TasksApp::Application.routes.draw do


  # devise_for :users
  devise_for :users, skip: :registrations

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :user do
    resource :registration,
             only: [:new, :create, :edit, :update],
             path: 'users',
             path_names: { new: 'sign_up' },
             controller: 'devise/registrations',
             as: :user_registration do
      get :cancel
    end
  end

  # devise_scope :admin do
  #   resource :registration,
  #            only: [:new, :create, :edit, :update, :destroy],
  #            path: 'admin/users',
  #            path_names: { new: 'sign_up' },
  #            controller: 'admin/registrations',
  #            as: :admin_user_registration do
  #     get :cancel
  #   end
  #
  #   # get 'admin/users/signup', to: "admin/registrations#new"
  # end

  # devise_for :admin, controllers: { registrations: 'admin/registrations' }


  resources :users
  resources :tasks do
     resources :comments, controller: 'tasks/comments'
  end

  resources :notifications do
    collection do
      get 'contextual_menu'
    end
  end


  namespace :admin do
    resources :users
    resources :user_roles 
    resources :task_categories
    resources :tasks
  end




  match 'admin/tasks/search' => 'admin/tasks#search', :as => :admin_tasks_search, via: [:post]
  match 'admin/users/:id/activation' => 'admin/users#activation', :as => :activation_admin_user, via: [:put]
  match 'admin/users/:id/permissions' => 'admin/user_roles#permissions', :as => :permissions_admin_user_roles, via: [:put]

  root to: 'home#index'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

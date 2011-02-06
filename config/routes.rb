Doer::Application.routes.draw do
  
  resources :users_decisions

  resources :decisions

  match 'suggestions/:id-:name' => 'suggestions#show'
  resources :suggestions
  
  # Suggestions 
  match 'suggestions/:suggestion_id/set_decision' => 'suggestions#set_decision'
  match 'suggestions/:suggestion_id/set_decision/:decision_id' => 'suggestions#set_decision'
  
  match 'suggestions/:suggestion_id/set_decision_status' => 'suggestions#set_decision_status'
  match 'suggestions/:suggestion_id/set_decision/:decision_status_id' => 'suggestions#set_decision_status'
  
  match 'suggestions/:suggestion_id/news_from/:last_update_stamp' => 'suggestions#news_from'
  match 'suggestions/new_suggestions_since/:last_update_stamp' => 'suggestions#new_suggestions_since', :as => :new_suggestions_since
  
  
  root :to => 'suggestions#index' # optional, this just sets the root route

  resource :account, :controller => "users"
  resources :users
  
  # Account
  match "account" => "account#index"
  match "registration" => "users#new"
  match "account/create" => "account#create"
  match "account/edit" => "account#edit"
  match "account/update" => "account#update"
  
  # Sessions
  match "login" => "user_sessions#new"
  match "user_sessions" => "user_sessions#create"
  match "logout" => "user_sessions#destroy"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

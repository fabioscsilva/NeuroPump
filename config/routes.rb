NeuroPump::Application.routes.draw do

  resources :evaluation_results

  resources :wms_results

  resources :packages

  match "packages_clinics/update" => 'packages_clinics#update'
  resources :packages_clinics
  
  resources :evaluation_tests
  
  resources :evaluation_results

  resources :wais_results
  match 'downloadWais' => 'wais_results#download'

  resources :tmt_results

  resources :ftt_results

  resources :clock_results
  match 'downloadClock' => 'clock_results#download'

  resources :appointments
  
  resources :appointment_plans

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  devise_for :logins, :controllers => {:sessions => "sessions"}

  resources :logins

  devise_scope :login do
  #  root :to => "devise/sessions#new"
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  #  get "sign_up", :to => "devise/registrations#new"
  end

  resources :clinical_histories

  match "patients/:id/games/:xid", :as => "stimulation", :controller => 'patients', :id => /[0-9]+/, :action => 'stimulation'
  match "patients/:id/games", :as => "games", :controller => 'patients', :id => /[0-9]+/, :action => 'games'
  resources :patients 

  resources :secretaries
  match 'sendSecretariesInvite' => 'secretaries#sendInvite'
  match 'inviteSecretaries' => 'secretaries#invite'

  resources :neuropsychologists
  match 'inviteNeuropsychologists' => 'neuropsychologists#invite'
  match 'sendNeuropsychologistsInvite' => 'neuropsychologists#sendInvite'

  resources :managers

  match "payments/generate" => 'payments#generate'
  match "payments/check" => 'payments#check'
  resources :payments

  match "clinics/changePackage" => 'clinics#changePackage'
  match "clinics/changePackageSubmit" => 'clinics#changePackageSubmit'
  resources :clinics

  resources :genders

  resources :civil_statuses

  resources :administrators

  resources :handednesses

  resources :visitors

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

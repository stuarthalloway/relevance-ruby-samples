ActionController::Routing::Routes.draw do |map|
  # codecite requirements
  map.resources :widgets, :requirements => {:id => /\d+/}
  # codecite requirements
  
  map.resources :contacts
  map.resources :changes
  
  map.resources :movies

  # codecite documents_changes
  map.resources :documents, :member => {:changes => :get}
  # codecite documents_changes

  # codecite posts_comments
  map.resources :posts, :has_many => [:comments]

  # codecite RESTful quotes
  map.resources :quotes
  # codecite RESTful quotes
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.

  # codecite map_root
  map.root :controller => "home"

  map.ajax 'ajax/:action', :controller => 'ajax'
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  # codecite map_static
  map.connect 'any/path/can/be/a/route', :controller => 'contacts', :action => 'special'

  # codecite map_path
  map.page 'contacts/extra/*path', :controller => 'contacts'

  # codecite map_requirements
  map.connect 'contacts/schedule/:year/:month/:day',
              :controller=>'contacts',
              :action=>'schedule',
              :requirements => {:year => /\d{4}/, 
                                :month => /\d{1,2}/,
                                :day => /\d{1,2}/}
  # codecite map_requirements

  # codecite named_route
  map.people 'people', :controller => 'contacts'

  # codecite restful_route
  map.resources :contacts
end

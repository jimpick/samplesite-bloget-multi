ActionController::Routing::Routes.draw do |map|
  map.resources :sites

  map.resources :users
  map.resource  :session

  map.signup  '/signup', :controller => 'users',   :action => 'new' 
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
 
  map.with_options :controller => 'posts', :conditions => {:method => :get} do |bloget|
    bloget.blog_url '/blog', :action => 'index'
    bloget.formatted_blog_url '/blog.:format', :action => 'index'
  end

  map.resources :posts do |post|
    post.resources :comments
  end

  #map.resources(:posts)
  #map.resources(:comments, :path_prefix => '/posts/:post_id')

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => "posts"

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end

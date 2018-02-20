Rails.application.routes.draw do
  # Routes for the Location resource:
  # CREATE
  get "/locations/new", :controller => "locations", :action => "new"
  post "/create_location", :controller => "locations", :action => "create"

  # READ
  get "/locations", :controller => "locations", :action => "index"
  get "/locations/:id", :controller => "locations", :action => "show"

  # UPDATE
  get "/locations/:id/edit", :controller => "locations", :action => "edit"
  post "/update_location/:id", :controller => "locations", :action => "update"

  # DELETE
  get "/delete_location/:id", :controller => "locations", :action => "destroy"
  #------------------------------

  # Routes for the Gig resource:
  # CREATE
  get "/gigs/new", :controller => "gigs", :action => "new"
  post "/create_gig", :controller => "gigs", :action => "create"

  # READ
  get "/gigs", :controller => "gigs", :action => "index"
  get "/gigs/:id", :controller => "gigs", :action => "show"

  # UPDATE
  get "/gigs/:id/edit", :controller => "gigs", :action => "edit"
  post "/update_gig/:id", :controller => "gigs", :action => "update"

  # DELETE
  get "/delete_gig/:id", :controller => "gigs", :action => "destroy"
  #------------------------------

  devise_for :clients
  # Routes for the Client resource:
  # READ
  get "/clients", :controller => "clients", :action => "index"
  get "/clients/:id", :controller => "clients", :action => "show"


  devise_for :photographers
  # Routes for the Photographer resource:
  # READ
  get "/photographers", :controller => "photographers", :action => "index"
  get "/photographers/:id", :controller => "photographers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
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

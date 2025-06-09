Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
  
  # Custom logout route
  post("/sessions/destroy", { :controller => "sessions", :action => "destroy" })
end
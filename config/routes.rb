Rails.application.routes.draw do
  # Routes for the Apple resource:
  # CREATE
  get "/apples/new", :controller => "apples", :action => "new"
  post "/create_apple", :controller => "apples", :action => "create"

  # READ
  get "/apples", :controller => "apples", :action => "index"
  get "/apples/:id", :controller => "apples", :action => "show"

  # UPDATE
  get "/apples/:id/edit", :controller => "apples", :action => "edit"
  post "/update_apple/:id", :controller => "apples", :action => "update"

  # DELETE
  get "/delete_apple/:id", :controller => "apples", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

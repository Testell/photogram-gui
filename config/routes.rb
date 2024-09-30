Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:username", { :controller => "users", :action => "show"})
  post("/insert_user", { :controller => "users", :action => "create"})
  post("/modify_user/:username", { :controller => "users", :action => "update"})
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy"})
end

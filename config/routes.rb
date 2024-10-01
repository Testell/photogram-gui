Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:username", { :controller => "users", :action => "show"})
  post("/insert_user", { :controller => "users", :action => "create"})
  post("/modify_user/:username", { :controller => "users", :action => "update"})
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  post("/insert_photo", { :controller => "photos", :action => "create"})
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update"})
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy"})
end

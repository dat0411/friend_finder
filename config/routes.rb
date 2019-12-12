Rails.application.routes.draw do
  # Routes for the Friendship resource:

  # CREATE
  get("/friendships/new", { :controller => "friendships", :action => "new_form" })
  post("/create_friendship", { :controller => "friendships", :action => "create_row" })

  # READ
  get("/friendships", { :controller => "friendships", :action => "index" })
  get("/friendships/:id_to_display", { :controller => "friendships", :action => "show" })

  # UPDATE
  get("/friendships/:prefill_with_id/edit", { :controller => "friendships", :action => "edit_form" })
  post("/update_friendship/:id_to_modify", { :controller => "friendships", :action => "update_row" })

  # DELETE
  get("/delete_friendship/:id_to_remove", { :controller => "friendships", :action => "destroy_row" })

  #------------------------------

  # Routes for the Travel plan resource:

  # CREATE
  get("/travel_plans/new", { :controller => "travel_plans", :action => "new_form" })
  post("/create_travel_plan", { :controller => "travel_plans", :action => "create_row" })

  # READ
  get("/travel_plans", { :controller => "travel_plans", :action => "index" })
  get("/travel_plans/:id_to_display", { :controller => "travel_plans", :action => "show" })

  # UPDATE
  get("/travel_plans/:prefill_with_id/edit", { :controller => "travel_plans", :action => "edit_form" })
  post("/update_travel_plan/:id_to_modify", { :controller => "travel_plans", :action => "update_row" })

  # DELETE
  get("/delete_travel_plan/:id_to_remove", { :controller => "travel_plans", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

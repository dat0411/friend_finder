Rails.application.routes.draw do
  # Routes for the Group membership resource:

  # CREATE
  get("/group_memberships/new", { :controller => "group_memberships", :action => "new_form" })
  post("/create_group_membership", { :controller => "group_memberships", :action => "create_row" })

  # READ
  get("/group_memberships", { :controller => "group_memberships", :action => "index" })
  get("/group_memberships/:id_to_display", { :controller => "group_memberships", :action => "show" })

  # UPDATE
  get("/group_memberships/:prefill_with_id/edit", { :controller => "group_memberships", :action => "edit_form" })
  post("/update_group_membership/:id_to_modify", { :controller => "group_memberships", :action => "update_row" })

  # DELETE
  get("/delete_group_membership/:id_to_remove", { :controller => "group_memberships", :action => "destroy_row" })

  #------------------------------

  # Routes for the Group admin resource:

  # CREATE
  get("/group_admins/new", { :controller => "group_admins", :action => "new_form" })
  post("/create_group_admin", { :controller => "group_admins", :action => "create_row" })

  # READ
  get("/group_admins", { :controller => "group_admins", :action => "index" })
  get("/group_admins/:id_to_display", { :controller => "group_admins", :action => "show" })

  # UPDATE
  get("/group_admins/:prefill_with_id/edit", { :controller => "group_admins", :action => "edit_form" })
  post("/update_group_admin/:id_to_modify", { :controller => "group_admins", :action => "update_row" })

  # DELETE
  get("/delete_group_admin/:id_to_remove", { :controller => "group_admins", :action => "destroy_row" })

  #------------------------------

  # Routes for the Group resource:

  # CREATE
  get("/groups/new", { :controller => "groups", :action => "new_form" })
  post("/create_group", { :controller => "groups", :action => "create_row" })

  # READ
  get("/groups", { :controller => "groups", :action => "index" })
  get("/groups/:id_to_display", { :controller => "groups", :action => "show" })

  # UPDATE
  get("/groups/:prefill_with_id/edit", { :controller => "groups", :action => "edit_form" })
  post("/update_group/:id_to_modify", { :controller => "groups", :action => "update_row" })

  # DELETE
  get("/delete_group/:id_to_remove", { :controller => "groups", :action => "destroy_row" })

  #------------------------------

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

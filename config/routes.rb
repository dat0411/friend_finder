Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "travel_plans#index"
  # Routes for the Location resource:

  # CREATE
  get("/locations/new", { :controller => "locations", :action => "new_form" })
  post("/create_location", { :controller => "locations", :action => "create_row" })

  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  get("/locations/:id_to_display", { :controller => "locations", :action => "show" })

  # UPDATE
  get("/locations/:prefill_with_id/edit", { :controller => "locations", :action => "edit_form" })
  post("/update_location/:id_to_modify", { :controller => "locations", :action => "update_row" })

  # DELETE
  get("/delete_location/:id_to_remove", { :controller => "locations", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Organization email resource:

  # CREATE
  get("/organization_emails/new", { :controller => "organization_emails", :action => "new_form" })
  post("/create_organization_email", { :controller => "organization_emails", :action => "create_row" })

  # READ
  get("/organization_emails", { :controller => "organization_emails", :action => "index" })
  get("/organization_emails/:id_to_display", { :controller => "organization_emails", :action => "show" })

  # UPDATE
  get("/organization_emails/:prefill_with_id/edit", { :controller => "organization_emails", :action => "edit_form" })
  post("/update_organization_email/:id_to_modify", { :controller => "organization_emails", :action => "update_row" })

  # DELETE
  get("/delete_organization_email/:id_to_remove", { :controller => "organization_emails", :action => "destroy_row" })
  get("/delete_organization_email_from_user/:id_to_remove", { :controller => "organization_emails", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Group membership resource:

  # CREATE
  get("/group_memberships/new", { :controller => "group_memberships", :action => "new_form" })
  post("/create_group_membership", { :controller => "group_memberships", :action => "create_row" })
  post("/create_group_membership_from_group", { :controller => "group_memberships", :action => "create_row_from_group" })

  # READ
  get("/group_memberships", { :controller => "group_memberships", :action => "index" })
  get("/group_memberships/:id_to_display", { :controller => "group_memberships", :action => "show" })

  # UPDATE
  get("/group_memberships/:prefill_with_id/edit", { :controller => "group_memberships", :action => "edit_form" })
  post("/update_group_membership/:id_to_modify", { :controller => "group_memberships", :action => "update_row" })

  # DELETE
  get("/delete_group_membership/:id_to_remove", { :controller => "group_memberships", :action => "destroy_row" })
  get("/delete_group_membership_from_user/:id_to_remove", { :controller => "group_memberships", :action => "destroy_row_from_user" })
  get("/delete_group_membership_from_group/:id_to_remove", { :controller => "group_memberships", :action => "destroy_row_from_group" })

  #------------------------------

  # Routes for the Group admin resource:

  # CREATE
  get("/group_admins/new", { :controller => "group_admins", :action => "new_form" })
  post("/create_group_admin", { :controller => "group_admins", :action => "create_row" })
  post("/create_group_admin_from_group", { :controller => "group_admins", :action => "create_row_from_group" })

  # READ
  get("/group_admins", { :controller => "group_admins", :action => "index" })
  get("/group_admins/:id_to_display", { :controller => "group_admins", :action => "show" })

  # UPDATE
  get("/group_admins/:prefill_with_id/edit", { :controller => "group_admins", :action => "edit_form" })
  post("/update_group_admin/:id_to_modify", { :controller => "group_admins", :action => "update_row" })

  # DELETE
  get("/delete_group_admin/:id_to_remove", { :controller => "group_admins", :action => "destroy_row" })
  get("/delete_group_admin_from_user/:id_to_remove", { :controller => "group_admins", :action => "destroy_row_from_user" })
  get("/delete_group_admin_from_group/:id_to_remove", { :controller => "group_admins", :action => "destroy_row_from_group" })

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
  get("/delete_friendship_from_receiver/:id_to_remove", { :controller => "friendships", :action => "destroy_row_from_receiver" })
  get("/delete_friendship_from_sender/:id_to_remove", { :controller => "friendships", :action => "destroy_row_from_sender" })

  #------------------------------

  # Routes for the Travel plan resource:

  # CREATE
  get("/travel_plans/new", { :controller => "travel_plans", :action => "new_form" })
  post("/create_travel_plan", { :controller => "travel_plans", :action => "create_row" })
  post("/create_travel_plan_from_location", { :controller => "travel_plans", :action => "create_row_from_location" })

  # READ
  get("/travel_plans", { :controller => "travel_plans", :action => "index" })
  get("/travel_plans/:id_to_display", { :controller => "travel_plans", :action => "show" })

  # UPDATE
  get("/travel_plans/:prefill_with_id/edit", { :controller => "travel_plans", :action => "edit_form" })
  post("/update_travel_plan/:id_to_modify", { :controller => "travel_plans", :action => "update_row" })

  # DELETE
  get("/delete_travel_plan/:id_to_remove", { :controller => "travel_plans", :action => "destroy_row" })
  get("/delete_travel_plan_from_location/:id_to_remove", { :controller => "travel_plans", :action => "destroy_row_from_location" })
  get("/delete_travel_plan_from_owner/:id_to_remove", { :controller => "travel_plans", :action => "destroy_row_from_owner" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

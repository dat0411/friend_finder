class GroupAdminsController < ApplicationController
  def index
    @group_admins = GroupAdmin.all

    render("group_admin_templates/index.html.erb")
  end

  def show
    @group_admin = GroupAdmin.find(params.fetch("id_to_display"))

    render("group_admin_templates/show.html.erb")
  end

  def new_form
    @group_admin = GroupAdmin.new

    render("group_admin_templates/new_form.html.erb")
  end

  def create_row
    @group_admin = GroupAdmin.new

    @group_admin.user_id = params.fetch("user_id")
    @group_admin.group_id = params.fetch("group_id")

    if @group_admin.valid?
      @group_admin.save

      redirect_back(:fallback_location => "/group_admins", :notice => "Group admin created successfully.")
    else
      render("group_admin_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @group_admin = GroupAdmin.find(params.fetch("prefill_with_id"))

    render("group_admin_templates/edit_form.html.erb")
  end

  def update_row
    @group_admin = GroupAdmin.find(params.fetch("id_to_modify"))

    @group_admin.user_id = params.fetch("user_id")
    @group_admin.group_id = params.fetch("group_id")

    if @group_admin.valid?
      @group_admin.save

      redirect_to("/group_admins/#{@group_admin.id}", :notice => "Group admin updated successfully.")
    else
      render("group_admin_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_group
    @group_admin = GroupAdmin.find(params.fetch("id_to_remove"))

    @group_admin.destroy

    redirect_to("/groups/#{@group_admin.group_id}", notice: "GroupAdmin deleted successfully.")
  end

  def destroy_row_from_user
    @group_admin = GroupAdmin.find(params.fetch("id_to_remove"))

    @group_admin.destroy

    redirect_to("/users/#{@group_admin.user_id}", notice: "GroupAdmin deleted successfully.")
  end

  def destroy_row
    @group_admin = GroupAdmin.find(params.fetch("id_to_remove"))

    @group_admin.destroy

    redirect_to("/group_admins", :notice => "Group admin deleted successfully.")
  end
end

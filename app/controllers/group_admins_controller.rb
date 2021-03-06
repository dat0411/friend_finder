class GroupAdminsController < ApplicationController
  before_action :current_user_must_be_group_admin_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_group_admin_user
    group_admin = GroupAdmin.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == group_admin.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.group_admins.ransack(params[:q])
    @group_admins = @q.result(:distinct => true).includes(:group, :user).page(params[:page]).per(10)

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

  def create_row_from_group
    @group_admin = GroupAdmin.new

    @group_admin.user_id = params.fetch("user_id")
    @group_admin.group_id = params.fetch("group_id")

    if @group_admin.valid?
      @group_admin.save

      redirect_to("/groups/#{@group_admin.group_id}", notice: "GroupAdmin created successfully.")
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

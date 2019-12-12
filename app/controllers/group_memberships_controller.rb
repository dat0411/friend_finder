class GroupMembershipsController < ApplicationController
  before_action :current_user_must_be_group_membership_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_group_membership_user
    group_membership = GroupMembership.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == group_membership.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @group_memberships = current_user.group_memberships.page(params[:page]).per(10)

    render("group_membership_templates/index.html.erb")
  end

  def show
    @group_membership = GroupMembership.find(params.fetch("id_to_display"))

    render("group_membership_templates/show.html.erb")
  end

  def new_form
    @group_membership = GroupMembership.new

    render("group_membership_templates/new_form.html.erb")
  end

  def create_row
    @group_membership = GroupMembership.new

    @group_membership.user_id = params.fetch("user_id")
    @group_membership.group_id = params.fetch("group_id")
    @group_membership.admin_approval = params.fetch("admin_approval")
    @group_membership.user_accept = params.fetch("user_accept")

    if @group_membership.valid?
      @group_membership.save

      redirect_back(:fallback_location => "/group_memberships", :notice => "Group membership created successfully.")
    else
      render("group_membership_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_group
    @group_membership = GroupMembership.new

    @group_membership.user_id = params.fetch("user_id")
    @group_membership.group_id = params.fetch("group_id")
    @group_membership.admin_approval = params.fetch("admin_approval")
    @group_membership.user_accept = params.fetch("user_accept")

    if @group_membership.valid?
      @group_membership.save

      redirect_to("/groups/#{@group_membership.group_id}", notice: "GroupMembership created successfully.")
    else
      render("group_membership_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @group_membership = GroupMembership.find(params.fetch("prefill_with_id"))

    render("group_membership_templates/edit_form.html.erb")
  end

  def update_row
    @group_membership = GroupMembership.find(params.fetch("id_to_modify"))

    
    @group_membership.group_id = params.fetch("group_id")
    @group_membership.admin_approval = params.fetch("admin_approval")
    @group_membership.user_accept = params.fetch("user_accept")

    if @group_membership.valid?
      @group_membership.save

      redirect_to("/group_memberships/#{@group_membership.id}", :notice => "Group membership updated successfully.")
    else
      render("group_membership_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_group
    @group_membership = GroupMembership.find(params.fetch("id_to_remove"))

    @group_membership.destroy

    redirect_to("/groups/#{@group_membership.group_id}", notice: "GroupMembership deleted successfully.")
  end

  def destroy_row_from_user
    @group_membership = GroupMembership.find(params.fetch("id_to_remove"))

    @group_membership.destroy

    redirect_to("/users/#{@group_membership.user_id}", notice: "GroupMembership deleted successfully.")
  end

  def destroy_row
    @group_membership = GroupMembership.find(params.fetch("id_to_remove"))

    @group_membership.destroy

    redirect_to("/group_memberships", :notice => "Group membership deleted successfully.")
  end
end

class GroupsController < ApplicationController
  def index
    @groups = Group.all

    render("group_templates/index.html.erb")
  end

  def show
    @group_admin = GroupAdmin.new
    @group_membership = GroupMembership.new
    @group = Group.find(params.fetch("id_to_display"))

    render("group_templates/show.html.erb")
  end

  def new_form
    @group = Group.new

    render("group_templates/new_form.html.erb")
  end

  def create_row
    @group = Group.new

    @group.group_name = params.fetch("group_name")
    @group.group_description = params.fetch("group_description")
    @group.group_photo = params.fetch("group_photo") if params.key?("group_photo")

    if @group.valid?
      @group.save

      redirect_back(:fallback_location => "/groups", :notice => "Group created successfully.")
    else
      render("group_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @group = Group.find(params.fetch("prefill_with_id"))

    render("group_templates/edit_form.html.erb")
  end

  def update_row
    @group = Group.find(params.fetch("id_to_modify"))

    @group.group_name = params.fetch("group_name")
    @group.group_description = params.fetch("group_description")
    @group.group_photo = params.fetch("group_photo") if params.key?("group_photo")

    if @group.valid?
      @group.save

      redirect_to("/groups/#{@group.id}", :notice => "Group updated successfully.")
    else
      render("group_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @group = Group.find(params.fetch("id_to_remove"))

    @group.destroy

    redirect_to("/groups", :notice => "Group deleted successfully.")
  end
end

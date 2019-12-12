class OrganizationEmailsController < ApplicationController
  before_action :current_user_must_be_organization_email_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_organization_email_user
    organization_email = OrganizationEmail.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == organization_email.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @organization_emails = OrganizationEmail.all

    render("organization_email_templates/index.html.erb")
  end

  def show
    @organization_email = OrganizationEmail.find(params.fetch("id_to_display"))

    render("organization_email_templates/show.html.erb")
  end

  def new_form
    @organization_email = OrganizationEmail.new

    render("organization_email_templates/new_form.html.erb")
  end

  def create_row
    @organization_email = OrganizationEmail.new

    @organization_email.user_id = params.fetch("user_id")
    @organization_email.status = params.fetch("status")
    @organization_email.organization_email = params.fetch("organization_email")

    if @organization_email.valid?
      @organization_email.save

      redirect_back(:fallback_location => "/organization_emails", :notice => "Organization email created successfully.")
    else
      render("organization_email_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @organization_email = OrganizationEmail.find(params.fetch("prefill_with_id"))

    render("organization_email_templates/edit_form.html.erb")
  end

  def update_row
    @organization_email = OrganizationEmail.find(params.fetch("id_to_modify"))

    
    @organization_email.status = params.fetch("status")
    @organization_email.organization_email = params.fetch("organization_email")

    if @organization_email.valid?
      @organization_email.save

      redirect_to("/organization_emails/#{@organization_email.id}", :notice => "Organization email updated successfully.")
    else
      render("organization_email_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @organization_email = OrganizationEmail.find(params.fetch("id_to_remove"))

    @organization_email.destroy

    redirect_to("/users/#{@organization_email.user_id}", notice: "OrganizationEmail deleted successfully.")
  end

  def destroy_row
    @organization_email = OrganizationEmail.find(params.fetch("id_to_remove"))

    @organization_email.destroy

    redirect_to("/organization_emails", :notice => "Organization email deleted successfully.")
  end
end

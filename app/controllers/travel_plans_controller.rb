class TravelPlansController < ApplicationController
  def index
    @travel_plans = TravelPlan.all

    render("travel_plan_templates/index.html.erb")
  end

  def show
    @travel_plan = TravelPlan.find(params.fetch("id_to_display"))

    render("travel_plan_templates/show.html.erb")
  end

  def new_form
    @travel_plan = TravelPlan.new

    render("travel_plan_templates/new_form.html.erb")
  end

  def create_row
    @travel_plan = TravelPlan.new

    @travel_plan.plan_description = params.fetch("plan_description")
    @travel_plan.start = params.fetch("start")
    @travel_plan.end = params.fetch("end")
    @travel_plan.owner_id = params.fetch("owner_id")
    @travel_plan.status = params.fetch("status")
    @travel_plan.location_id = params.fetch("location_id")

    if @travel_plan.valid?
      @travel_plan.save

      redirect_back(:fallback_location => "/travel_plans", :notice => "Travel plan created successfully.")
    else
      render("travel_plan_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @travel_plan = TravelPlan.new

    @travel_plan.plan_description = params.fetch("plan_description")
    @travel_plan.start = params.fetch("start")
    @travel_plan.end = params.fetch("end")
    @travel_plan.owner_id = params.fetch("owner_id")
    @travel_plan.status = params.fetch("status")
    @travel_plan.location_id = params.fetch("location_id")

    if @travel_plan.valid?
      @travel_plan.save

      redirect_to("/locations/#{@travel_plan.location_id}", notice: "TravelPlan created successfully.")
    else
      render("travel_plan_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @travel_plan = TravelPlan.find(params.fetch("prefill_with_id"))

    render("travel_plan_templates/edit_form.html.erb")
  end

  def update_row
    @travel_plan = TravelPlan.find(params.fetch("id_to_modify"))

    @travel_plan.plan_description = params.fetch("plan_description")
    @travel_plan.start = params.fetch("start")
    @travel_plan.end = params.fetch("end")
    @travel_plan.owner_id = params.fetch("owner_id")
    @travel_plan.status = params.fetch("status")
    @travel_plan.location_id = params.fetch("location_id")

    if @travel_plan.valid?
      @travel_plan.save

      redirect_to("/travel_plans/#{@travel_plan.id}", :notice => "Travel plan updated successfully.")
    else
      render("travel_plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_owner
    @travel_plan = TravelPlan.find(params.fetch("id_to_remove"))

    @travel_plan.destroy

    redirect_to("/users/#{@travel_plan.owner_id}", notice: "TravelPlan deleted successfully.")
  end

  def destroy_row_from_location
    @travel_plan = TravelPlan.find(params.fetch("id_to_remove"))

    @travel_plan.destroy

    redirect_to("/locations/#{@travel_plan.location_id}", notice: "TravelPlan deleted successfully.")
  end

  def destroy_row
    @travel_plan = TravelPlan.find(params.fetch("id_to_remove"))

    @travel_plan.destroy

    redirect_to("/travel_plans", :notice => "Travel plan deleted successfully.")
  end
end

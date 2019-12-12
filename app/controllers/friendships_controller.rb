class FriendshipsController < ApplicationController
  before_action :current_user_must_be_friendship_sender, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_friendship_sender
    friendship = Friendship.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == friendship.sender
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @friendships = current_user.friendships.page(params[:page]).per(10)

    render("friendship_templates/index.html.erb")
  end

  def show
    @friendship = Friendship.find(params.fetch("id_to_display"))

    render("friendship_templates/show.html.erb")
  end

  def new_form
    @friendship = Friendship.new

    render("friendship_templates/new_form.html.erb")
  end

  def create_row
    @friendship = Friendship.new

    @friendship.sender_id = params.fetch("sender_id")
    @friendship.receiver_id = params.fetch("receiver_id")
    @friendship.status = params.fetch("status")

    if @friendship.valid?
      @friendship.save

      redirect_back(:fallback_location => "/friendships", :notice => "Friendship created successfully.")
    else
      render("friendship_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @friendship = Friendship.find(params.fetch("prefill_with_id"))

    render("friendship_templates/edit_form.html.erb")
  end

  def update_row
    @friendship = Friendship.find(params.fetch("id_to_modify"))

    
    @friendship.receiver_id = params.fetch("receiver_id")
    @friendship.status = params.fetch("status")

    if @friendship.valid?
      @friendship.save

      redirect_to("/friendships/#{@friendship.id}", :notice => "Friendship updated successfully.")
    else
      render("friendship_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_sender
    @friendship = Friendship.find(params.fetch("id_to_remove"))

    @friendship.destroy

    redirect_to("/users/#{@friendship.sender_id}", notice: "Friendship deleted successfully.")
  end

  def destroy_row_from_receiver
    @friendship = Friendship.find(params.fetch("id_to_remove"))

    @friendship.destroy

    redirect_to("/users/#{@friendship.receiver_id}", notice: "Friendship deleted successfully.")
  end

  def destroy_row
    @friendship = Friendship.find(params.fetch("id_to_remove"))

    @friendship.destroy

    redirect_to("/friendships", :notice => "Friendship deleted successfully.")
  end
end

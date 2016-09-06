class MembershipsController < ApplicationController

  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    if cannot? :join, idea
      redirect_to ideas_path, alert: "Can't join as a member of your own idea"
    else
      member = Membership.new user: current_user, idea: idea
      if member.save
        redirect_to ideas_path, notice: "Joined Idea"
      else
        redirect_to ideas_path, alert: like.errors.full_messages.join(", ")
      end
    end
  end

  def destroy
    member = Membership.find params[:id]
    if can? :destroy, member
      member.destroy
      redirect_to ideas_path, notice: "Left Idea"
    end
  end

end

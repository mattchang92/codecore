class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    if cannot? :like, idea
      redirect_to ideas_path, alert: "Can't like your own idea"
    else
      like = Like.new user: current_user, idea: idea
      if like.save
        redirect_to ideas_path, notice: "Liked"
      else
        redirect_to ideas_path, alert: like.errors.full_messages.join(", ")
      end
    end
  end

  def destroy
    like = Like.find params[:id]
    if can? :destroy, like
      like.destroy
      redirect_to ideas_path, notice: "Like"
    end
  end

end

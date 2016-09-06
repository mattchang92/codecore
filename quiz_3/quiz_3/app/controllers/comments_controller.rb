class CommentsController < ApplicationController

  def create
    @comment = Comment.new params.require(:comment).permit(:body)
    @idea = Idea.find params[:idea_id]
    @comment.idea = @idea
    @comment.user = current_user

    if !user_signed_in?
      redirect_to new_session_path
    elsif @comment.save
      redirect_to idea_path(@idea), notice: "Comment added"
    else
      flash[:alert] = "Can't submit an empty comment"
      redirect_to idea_path(@idea)
    end

  end

  def destroy

    idea = Idea.find params[:idea_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to idea_path(idea), notice: "Comment deleted"
  end

end

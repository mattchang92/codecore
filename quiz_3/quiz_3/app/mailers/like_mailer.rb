class LikeMailer < ApplicationMailer

  def notify_idea_owner(like)
    @like = like
    @idea = like.idea
    @idea_owner = like.idea.user

    if @idea_owner
      # mail(to: @question_owner.email, subject: "You got a new answer to your question")
      mail(to: "matthewchang3150@hotmail.com", subject: "You've got mail!")
    end
  end


end

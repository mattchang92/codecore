require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:idea) { FactoryGirl.create :idea }
  let(:user) { FactoryGirl.create :user }
  let(:comment) { FactoryGirl.create :comment}

  describe "#create" do
    context "with no signed in user" do
      it "redirects to sign in path" do
        post :create, params: { comment: {body: "Hello World"}, idea_id: idea.id }
        expect(response).to redirect_to new_session_path
      end

      it "doesn't save to the database" do
        count_before = Comment.all.count
        post :create, params: { comment: {body: "Hello World"}, idea_id: idea.id }
        count_after = Comment.all.count
        expect(count_before).to eq(count_after)
      end
    end

    context "with signed in user" do
      # before statement creates a signed in user for every session
      before { request.session[:user_id] = user.id}
      def valid_request
        post :create, params: { comment: {body: "Hello World"}, idea_id: idea.id }
      end

      it "redirects to the ideas show page" do
        valid_request
        expect(response).to redirect_to idea_path(idea)
      end

      it "associates the created comment with the logged in user" do
        valid_request
        expect(Comment.last.user).to eq(user)
      end
    end
  end

  describe "#destroy" do

    context "with signed in user" do
      # before statement creates a signed in user for every session
      before { request.session[:user_id] = user.id}
      def valid_request
        post :create, params: { comment: {body: "Hello World"}, idea_id: idea.id }
      end

      it "redirects to the ideas show page" do
        valid_request
        c = Comment.last
        delete :destroy, params: { id: c.id, idea_id: idea.id }
        expect(response).to redirect_to idea_path(idea)
      end

      it "it deletes the comment from the database" do
        valid_request
        count_before = Comment.all.count
        c = Comment.last
        delete :destroy, params: { id: c.id, idea_id: idea.id }
        count_after = Comment.all.count
        expect(count_after).to eq(count_before - 1)
      end
    end
  end


end

# Users must be logged in to create or delete comments
# Creating or deleting comments redirects back to the idea show page
# Comments get associated with the logged in user
# Users can only delete their own comments
# [Bonus] idea owners can delete any comments on their ideas (+5%)

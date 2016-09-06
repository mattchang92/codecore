class IdeasController < ApplicationController

  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :new]
  before_action :authorize, only: [:destroy, :update, :edit]

  IDEAS_PER_PAGE = 10

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user

    if @idea.save
      redirect_to idea_path(@idea), notice: "Idea created successfully"
    else
      render :new
    end
  end

  def show
    @members = @idea.memberships
    @comment = Comment.new
  end

  def index
    @ideas = Idea.order(created_at: :desc).page(params[:page]).per(IDEAS_PER_PAGE)
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end


  private

  def find_idea
    @idea = Idea.find params[:id]
  end

  def idea_params
    params.require(:idea).permit([:title,:description])
  end

end

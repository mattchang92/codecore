class RequestsController < ApplicationController

  REQUESTS_PER_PAGE = 7
  before_action :find_request, only: [:edit, :update, :destroy]


  def new
    @request = Request.new
  end

  def create
    @request = Request.new request_params
    @request.department = params[:department]
    if @request.save
      redirect_to requests_path, notice: "Request created successfully"
    else
      render :new
    end
  end

  def show
    redirect_to requests_path
  end

  def update
    @request.update request_params
    @request.update params.permit([:department])
    redirect_to requests_path
  end

  def destroy
    @request.destroy
    redirect_to requests_path
  end

  def index
    if params[:id].to_i > 0
      @request = Request.find params[:id]
      @request.status == false ? @request.status = true : @request.status = false
      @request.save
    end

    if params[:search_item]
      @search_item = params[:search_item]
      @requests = Request.where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?", "%#{@search_item}%","%#{@search_item}%","%#{@search_item}%","%#{@search_item}%"]).page(params[:page]).per(REQUESTS_PER_PAGE)
    else
      @requests = Request.order(created_at: :desc).page(params[:page]).per(REQUESTS_PER_PAGE)
    end
  end

  private

  def find_request
    @request = Request.find params[:id]
  end

  def request_params
    params.require(:request).permit([:name,:email,:message])
  end

end

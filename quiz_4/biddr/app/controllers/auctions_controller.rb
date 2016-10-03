class AuctionsController < ApplicationController

  before_action :find_auction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :new]
  before_action :authorize, only: [:destroy, :update, :edit]


  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user

    if @auction.save
      redirect_to auction_path(@auction), notice: "Auction created successfully"
    else
      render :new
    end
  end

  def show
    @bid = Bid.new
    @bids = @auction.bids.order(created_at: :desc)
  end

  def index
    @auctions = Auction.order(created_at: :desc)
  end

  def edit
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path
  end


  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit([:title, :details, :end_date, :reserve_price])
  end

end

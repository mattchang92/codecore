class BidsController < ApplicationController

  before_action :authenticate_user!

  def create
    @auction = Auction.find params[:auction_id]
    if cannot? :bid, @auction
      redirect_to auction_path(@auction), alert: "Can't bid on your own auction"
    else
      respond_to do |format|
        if (!@auction.bids.present?) || (params[:bid][:amount].to_f > @auction.bids.last.amount.to_f)
          @bid = Bid.new user: current_user, auction: @auction
          @bid.amount = params[:bid][:amount]
          check_reserve
          if @bid.save
            format.js {render :bid_success}
            format.html {redirect_to auction_path(@auction), notice: "Bid placed"}
          else
            format.html {redirect_to auction_path(@auction), alert: bid.errors.full_messages.join(", ")}
          end
        else
          format.html {redirect_to auction_path(@auction), alert: "Your bid must be higher than the current bid"}
        end
      end
    end
  end

  private

  def check_reserve
    if @bid.amount.to_f >= @auction.reserve_price
      @auction.reserve_succeed!
    end
  end


end

require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  let(:user) {FactoryGirl.create :user}
  let(:auction) {FactoryGirl.create :auction}

  describe "#create" do
    before { request.session[:user_id] = user.id }

    context "with valid parameters" do
      def valid_request
        post :create, params: { bid: {amount: rand(100), user_id: user.id },
                                auction_id: auction.id}
      end

      it "saves a record to the database" do
        session[:user_id] = user.id
        count_before = Bid.count
        valid_request
        count_after = Bid.count
        expect(count_after).to eq(count_before + 1)
      end

      it "redirects to the auction show page" do
        session[:user_id] = user.id
        valid_request
        expect(response).to redirect_to(auction_path(Auction.last))
      end
    end
  end


end

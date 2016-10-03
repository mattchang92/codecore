require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  let(:user) {FactoryGirl.create :user}

  describe "#new" do

    context "user signed in" do
      it "renders the new template" do
        session[:user_id] = user.id
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "no user signed in" do
      it "redirects to the sign in page" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "#create" do
    before { request.session[:user_id] = user.id }

    context "with valid parameters" do
      def valid_request
        post :create, params: { auction: {title: "auction title",
                                          details: "hello",
                                          reserve_price: 500,
                                          end_date: Time.now + 10.days,
                                          user_id: user.id }}
      end

      it "saves a record to the database" do
        count_before = Auction.count
        valid_request
        count_after = Auction.count
        expect(count_after).to eq(count_before + 1)
      end

      it "redirects to the auction show page" do
        valid_request
        expect(response).to redirect_to(auction_path(Auction.last))
      end
    end
  end

end

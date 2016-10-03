  require 'rails_helper'

  describe 'creating an auction', type: :feature do
    let(:user) { FactoryGirl.create :user }

    # scenario 'loads the auction create page' do
    #   page.set_rack_session(user_id: user.id)
    #   visit '/auctions/new'
    #   expect(page).to have_content 'Create New Auction'
    # end

    context 'user not signed in' do
      it 'loads the login page' do
        visit '/auctions/new'
        expect(page).to have_content 'Sign In'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
      end
    end

  end
  

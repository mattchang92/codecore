require 'rails_helper'

describe 'creating an bid', type: :feature do
  let(:user) { FactoryGirl.create :user }
  let(:auction) { FactoryGirl.create :auction }

  # context 'user signed in' do
  #   it 'loads the login page' do
  #     visit auction_path(auction)
  #     fill_in 'bid[amount]', with: 100
  #     click_button 'Create Bid'
  #   end
  # end

  context 'user not signed in' do
    it 'loads the login page' do
      visit auction_path(auction)
      fill_in 'bid[amount]', with: 100
      click_button 'Create Bid'
      expect(page).to have_content 'Sign In'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
    end
  end

end

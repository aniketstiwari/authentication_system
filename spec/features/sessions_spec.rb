require 'spec_helper'

RSpec.feature "Users", type: :feature do
  context "Login user" do
    scenario 'should be successfull' do
      visit login_path
      within('form') do
        fill_in 'email', with: 'aniket@gmail.com'
        fill_in 'password', with: 'aniket'
      end
      click_button 'Log In'
      expect(page).to have_content('Logged in as aniket@gmail.com')
      expect(page).to have_content('Log Out')
    end

    scenario 'should fail' do
      visit login_path
      within('form') do
        fill_in 'email', with: 'aniket@gmail.com'
        fill_in 'password', with: 'anike'
      end
      click_button 'Log In'
      expect(page).to have_content('Email or password is invalid')
    end
  end
end

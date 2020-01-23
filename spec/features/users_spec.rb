require 'spec_helper'

RSpec.feature "Users", type: :feature do
  context "creating new user" do
    scenario 'should be successfull' do
      visit signup_path
      within('form') do
        fill_in 'user_email', with: 'aniket@gmail.com'
        fill_in 'user_password', with: 'aniket'
        fill_in 'user_password_confirmation', with: 'aniket'
        check('user_terms')
      end
      click_button 'Sign Up'
      expect(page).to have_content('You have signed up')
    end

    scenario 'should fail' do
      visit signup_path
      within('form') do
        fill_in 'user_email', with: 'aniket@'
        fill_in 'user_password', with: 'aniket'
        fill_in 'user_password_confirmation', with: 'asniket'
      end
      click_button 'Sign Up'
      expect(page).to have_content('Password confirmation doesn\'t match Password')
      expect(page).to have_content('Terms must be accepted')
      expect(page).to have_content('Email is invalid')
    end
  end
end

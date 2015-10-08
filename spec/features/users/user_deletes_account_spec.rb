require 'rails_helper'

feature 'user deletes account', %{
  As a User
  I want to delete my account
  So that my information is no longer available

  Acceptance Criteria
  [X] I must be signed in to delete my account
  [X] I may only delete my own account
  [X] I must be able to access the delete function from my user detail page
  [X] I must receive a confirmation when my account is deleted
} do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user deletes the account' do
    login_with_email(user)
    click_link 'My Profile'
    click_on 'Account Settings'
    click_button 'Cancel my account'

    expect(page).to have_content('account has been successfully cancelled.')
    login_with_email(user)
    click_button 'Log in'
    expect(page).to have_content('Invalid login or password.')
  end

  scenario 'user cannot access users#delete if not authenticated' do
    login_with_email(user)
    click_link 'Sign Out'
    visit edit_user_registration_path

    expect(page).to have_content('You need to sign in or sign up before')
  endg
end

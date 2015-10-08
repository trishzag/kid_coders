require 'rails_helper'

feature 'user logs in', %{
  As a User
  I want to log in
  So that I have access to the entire site

  Acceptance Criteria
  [X] I may sign in using my username or email
  [X] I must provide my user password
  [X] I must receive a confirmation when I am signed in
  [X] I must receive an error message if I submit an incomplete form
} do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }

  scenario 'login with email, using valid credentials' do
    visit new_user_session_path
    login_with_email(user)

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
  end

  scenario 'login with username, using valid credentials' do
    visit new_user_session_path
    login_with_username(user2)

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path
    click_button 'Log in'

    expect(page).to have_content('Invalid login or password')
    expect(page).to_not have_content('Sign Out')
  end
end

require 'rails_helper'

feature 'user registers', %{
  As a User
  I want to create an account
  So that I have access to the site

  Acceptance Criteria
  [X] I must add my first name, last name, username and password
  [X] I may optionally add an email
  [X] I may not choose a username or email already in use
  [X] I must receive a success message if my registration is complete
  [X] I must receive an error message if I submit an incomplete form
} do

  scenario 'provide valid registration information' do
    create_registration

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide valid registration information without email' do
    create_registration_without_email

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide username that duplicates another user email' do
    create_registration

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')

    click_link 'Sign Out'
    visit new_user_registration_path

    register_with_another_user_email
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end

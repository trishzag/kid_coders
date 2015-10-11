require 'rails_helper'

feature 'user views user detail', %{
  As a User
  I want to view all of my account details
  So that I can see all of my assignments and progress simultaneously

  Acceptance Criteria
  [X] I must be signed in to view my detail page
  [X] I can only access my own detail page
  [X] I must be able to view all of my curricula and assignments
  [X] I must be able to navigate to my account detail page from the site index
} do
  let!(:user) { FactoryGirl.create(:user_with_two_userplans) }
  let!(:user2) { FactoryGirl.create(:user_with_userplan) }

  scenario "user views user detail page, including curricula" do
    curricula = user2.curricula
    login_with_username(user2)
    visit root_path
    click_link 'My Profile'

    curricula.each do |curriculum|
      expect(page). to have_content(curriculum.name)
    end
    expect(page).to have_content(user2.username)
  end

  scenario "visitor cannot view user detail page" do
    visit root_path
    expect(page).to_not have_link("My Profile")

    visit user_path(user)

    expect(page).to have_content("You need to sign in or sign up before")
  end

  scenario "logged in user cannot view another user detail page" do
    visit root_path
    login_with_username(user2)
    expect(page).to have_link("My Profile")

    visit user_path(user)

    expect(page).to have_content(user2.username)
    expect(page).to_not have_content(user.username)
  end

  scenario "user can view all assignments" do
    assignments = user2.assignments
    login_with_username(user2)
    visit user_path(user2)

    assignments.each do |assignment|
      expect(page).to have_content(assignment.title)
    end
    expect(page).to have_content(user2.username)
    expect(page).to_not have_content(user.username)
  end
end

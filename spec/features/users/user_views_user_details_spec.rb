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
  5.times { FactoryGirl.create(:related_assignments, curriculum_id: 1) }
  let!(:user) { FactoryGirl.create(:user_with_two_userplans) }
  let!(:user2) { FactoryGirl.create(:user_with_userplan, curriculum_id: 1) }

  scenario "user views user detail page, including curricula" do
    user_views_user_curricula(user)

    expect(page).to_not have_content(user2.curricula.first.name)
    expect(page).to_not have_content(user2.curricula.last.name)
  end

  scenario "visitor cannot view user detail page" do
    sign_out(user)
    expect(page).to_not have_link("My Profile")

    visit user_path(user)

    expect(page).to have_content("do not have permission")
    expect(page).to_not have_content(user.username)
    expect(page).to_not have_content(user2.username)
  end

  scenario "logged in user cannot view another user detail page" do
    user_curriculum = user.curricula.first
    user2_curriculum = user2.curricula.last
    visit root_path
    login_with_username(user2)
    expect(page).to have_link("My Profile")

    visit user_path(user)

    expect(page).to have_content("do not have permission")
    expect(page).to_not have_content(user.username)
    expect(page).to_not have_content(user_curriculum.name)
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user2_curriculum.last.name)
  end

  scenario "user can view all assignments" do
    user_curriculum = user.curricula.first
    user2_curriculum = user2.curricula.last
    user_views_assignments(user2)

    @assignments.each do |assignment|
      expect(page).to have_content(assignment.title)
    end
    expect(page).to_not have_content(user.username)
  end

  scenario "user can view all grades" do
    user_views_grades(user)

    @grades.each do |grade|
      expect(page).to have_content(grade)
    end
    expect(page).to_not have_content(user2.username)
  end
end

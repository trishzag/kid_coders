require 'rails_helper'

feature 'user views curriculum detail', %{As a User
  I want to view all assignments for a curriculum
  So that I know what I must learn to complete the curriculum

  Acceptance Criteria
  [X] I must see a link to curriculum detail on the curricula index page
  [X] I must see be signed in to view the curriculum detail
  [X] I must see an error if I am not signed and be redirected to log in page
  [X] I must see the name of the curriculum I am reviewing
  [X] I must see a complete list of assignments for the curriculum
  [X] I must see a link to my user detail page if I am signed in
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:curriculum) { FactoryGirl.create(:curriculum_with_assignments) }

  scenario 'user visits curriculum detail page' do
    assignments = curriculum.assignments
    visit root_path
    login_with_username(user)
    click_link("View Curricula")
    find("a[href='#{curriculum_path(curriculum)}']").click

    expect(page).to have_content(curriculum.name)
    assignments.each do |assignment|
      expect(page).to have_content(assignment.title)
    end

    click_link("My Profile")
    expect(page).to have_content(user.username)
  end

  scenario 'visitor cannot access curriculum detail page' do
    assignments = curriculum.assignments
    visit curriculum_path(curriculum)

    expect(page).to have_content("You need to sign in or sign up before")
    expect(page).to have_content("Log in")
    assignments.each do |assignment|
      expect(page).to_not have_content(assignment.title)
    end
  end
end

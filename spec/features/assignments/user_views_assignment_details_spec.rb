require 'rails_helper'

feature 'user views assignment detail', %{As a User
  I want to view detailed information for each assignment
  So that I have access to all of the materials while I complete the assignment

  Acceptance Criteria
  [ ] I must be signed in to view detailed information about each assignment
  [ ] I must see all content for the assignment on the assignment detail page
  [ ] I must see a link to the assignment detail from the curriculum show page
  [ ] I must see a link to the assignment detail from my user account page if I
  have the curriculum on my userplan
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:curriculum) { FactoryGirl.create(:curriculum_with_assignments) }

  scenario 'visitor cannot access the assignment detail' do
    assignments = curriculum.assignments
    visit root_path
    click_link("View Curricula")
    find("a[href='#{curriculum_path(curriculum)}']").click

    expect(page).to have_content("You need to sign in or sign up before")
    expect(page).to have_content("Log in")
    assignments.each do |assignment|
      expect(page).to_not have_content(assignment.title)
    end
  end

  scenario 'signed in user can view the assignment detail' do
    assignments = curriculum.assignments
    assignment = assignments.first
    other_assignment = assignments.last
    login_with_username(user)
    click_link("View Curricula")
    find("a[href='#{curriculum_path(curriculum)}']").click
    find("a[href='#{assignment_path(assignment)}']").click

    expect(page).to have_content(assignment.title)
    contents = assignment.contents
      contents.each do |content|
        expect(page).to have_content(content.title)
        expect(page).to have_content(content.description)
        expect(page).to have_content(content.source)
      end

    resources = assignment.resources
      resources.each do |resource|
        expect(page).to have_content(resource.name)
        expect(page).to have_content(resource.source)
      end

      expect(page).to_not have_content(other_assignment.title)
      contents = other_assignment.contents
        contents.each do |content|
          expect(page).to_not have_content(content.title)
          expect(page).to_not have_content(content.description)
          expect(page).to_not have_content(content.source)
        end

      resources = other_assignment.resources
        resources.each do |resource|
          expect(page).to_not have_content(resource.name)
          expect(page).to_not have_content(resource.source)
        end
  end

  scenario 'user can access the assignment detail from user detail page' do
    FactoryGirl.create(:userplan, user: user, curriculum: curriculum)
    assignments = curriculum.assignments
    assignment = assignments.first
    login_with_username(user)
    visit user_path(user)

    expect(page).to have_content(assignment.title)
    find("a[href='#{assignment_path(assignment)}']").click

    expect(page).to have_content(assignment.title)
    contents = assignment.contents
      contents.each do |content|
        expect(page).to have_content(content.title)
        expect(page).to have_content(content.description)
        expect(page).to have_content(content.source)
      end

    resources = assignment.resources
      resources.each do |resource|
        expect(page).to have_content(resource.name)
        expect(page).to have_content(resource.source)
      end
  end
end

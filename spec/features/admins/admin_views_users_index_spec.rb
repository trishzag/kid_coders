require 'rails_helper'

feature 'admin views users index page', %{
  As an Admin
  I want to see all users
  So that I know who is registered on our site

  Acceptance Criteria
  [X] I must be able to view all registered user on users index page
  [X] I must see a link to users index page from root_path if I am an admin
  [X] I must be an admin (admin == true) in order to see the users index page
  [X] I must receive an error and be redirected to index page if not an admin
} do
  let!(:student_user) { FactoryGirl.create(:user) }
  let!(:another_user) { FactoryGirl.create(:user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:curriculum) { FactoryGirl.create(:curriculum_with_assignments) }

  scenario 'user without admin role cannot view users index' do
    login_with_username(student_user)
    visit users_path

    expect(page).to have_content("You must be an admin to access that page.")
  end

  scenario 'user with admin role can view users index' do
    students =
    login_with_username(admin)
    click_link("View All Users")

    expect(page).to have_content(student_user.username)
    expect(page).to have_content(user.username)
    expect(page).to have_content(another_user.username)
    expect(page).to have_content(admin.username)
    expect(page).to have_content("All Users")
  end
end

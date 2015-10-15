require 'rails_helper'

feature 'Admin deletes a user', %{As an Admin
  I want to delete a user
  So that only active users are on our site

  Acceptance Criteria
  [X] I must see a link to delete a user on users index page
  [X] I must receive a success message after the user is deleted
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:curriculum) { FactoryGirl.create(:curriculum_with_assignments) }

  scenario 'user cannot delete another user' do
    login_with_email(user)
    visit users_path

    expect(page).to have_content("You must be an admin to access that page.")
    expect(page).to have_content("Come learn to code")
    expect(page).to have_content("View Curricula")
  end

  scenario 'user with admin privileges deletes another user' do
    login_with_username(admin)
    click_link('View All Users')

    find("#delete-#{user.id}", "Delete").click
    expect(page).to have_content("User deleted successfully")
  end
end

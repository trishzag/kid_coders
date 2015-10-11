require 'rails_helper'

feature 'user views curricula', %{As a User
  I want to see all available curricula
  So that I can choose what to learn next

  Acceptance Criteria
  [X] I must see each curriculum
  [X] I must be able to navigate to the curricula index from the home page
  [X] I must be able to view all curricula as a user or visitor
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:curriculum) { FactoryGirl.create(:curriculum, name: "Apples") }
  let!(:curriculum2) { FactoryGirl.create(:curriculum, name: "name2") }
  let!(:curriculum3) { FactoryGirl.create(:curriculum, name: "Zoos") }

  scenario "user views curricula index" do
    visit root_path
    login_with_username(user)
    click_link("View Curricula")

    expect(page.body).to have_content(curriculum.name)
    expect(page.body).to have_content(curriculum2.name)
    expect(page.body).to have_content(curriculum3.name)
  end

  scenario "visitor views curricula index" do
    visit root_path
    click_link("View Curricula")

    expect(page.body).to have_content(curriculum.name)
    expect(page.body).to have_content(curriculum2.name)
    expect(page.body).to have_content(curriculum3.name)
  end
end

module RegistrationHelper
  def create_registration
    FactoryGirl.build(:group)
    visit new_user_registration_path

    fill_in 'First name', with: "Jane"
    fill_in 'Last name', with: "Doe"
    fill_in 'Username', with: "janedoe"
    fill_in 'Email', with: "jd@example.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
  end

  def create_registration_without_email
    visit new_user_registration_path

    fill_in 'First name', with: "Jane"
    fill_in 'Last name', with: "Doe"
    fill_in 'Username', with: "janedoe"
    fill_in 'Email', with: "jd@example.com"
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
  end

  def register_with_another_user_email
    fill_in 'First name', with: "Jean"
    fill_in 'Last name', with: "Dope"
    fill_in 'Username', with: "jd@example.com"
    fill_in 'Password', with: 'password17'
    fill_in 'Password confirmation', with: 'password17'

    click_button 'Sign up'
  end
end

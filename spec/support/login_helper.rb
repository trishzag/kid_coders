module LoginHelper
  def login_with_email(user)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  def login_with_username(user)
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
end

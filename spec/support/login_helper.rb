module LoginHelper
  def login_with_email(user)
    find(:xpath, "//a[@href='/users/sign_in']").click

    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  def login_with_username(user)
    find(:xpath, "//a[@href='/users/sign_in']").click

    fill_in 'Login', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  def sign_out(user)
    find(:xpath, "//a[@href='/users/sign_out']").click
  end
end

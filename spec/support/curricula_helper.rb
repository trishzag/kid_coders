module CurriculaHelper
  def user_views_user_curricula(user)
    curricula = user.curricula
    login_with_username(user)
    clink_link "My Profile"
  end

  def user_views_assignments(user)
    user_views_user_curricula(user)
    assignments = user.assignments
  end
end

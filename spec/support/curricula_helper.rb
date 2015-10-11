module CurriculaHelper
  def user_views_user_curricula(user)
    @curricula = user.curricula
    login_with_username(user)
    clink_link "My Profile"

    @curricula.each do |curriculum|
      expect(page).to have_content(curriculum.name)
    end
    expect(page).to have_content(user.username)
  end

  def user_views_assignments(user)
    user_views_user_curricula(user)
    @assignments = user.assignments
  end

  def user_views_grades(user)
    user_views_assignments(user)
    @grades = user.grades
  end
end

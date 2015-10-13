class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @assignment = Assignment.find(params[:id])
    @contents = @assignment.contents.order(title: :asc)
    @resources = @assignment.resources.order(name: :asc)
  end

  def graded
    @user == current_user
    @grades = Grade.where(user_id: current_user)
    @grades.each do |grade|
      if grade.assignment_id == assignment.id
        return true
    end
  end

  def complete
    if graded(assignment) && grade == "Pass"
      return true
    end
  end

  def count
    if complete(assignment)
      count +=1
    end
  end

  protected

  def assignment_params
    params.require(:curriculum).permit(:title, :id)
  end
end

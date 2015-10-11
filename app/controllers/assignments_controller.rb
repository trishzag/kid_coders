class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @assignment = Assignment.find(params[:id])
    @contents = @assignment.contents.order(title: :asc)
    @resources = @assignment.resources.order(name: :asc)
  end

  protected

  def assignment_params
    params.require(:curriculum).permit(:title, :id)
  end
end

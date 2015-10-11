class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @assignment = Assignment.find(params[:id])
    @contents = @assignment.contents.order(title: :asc)
    @resources = @assignment.resources.order(name: :asc)
  end
end

class CurriculaController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @curricula = Curriculum.order(name: :asc)
  end

  def show
    @curriculum = Curriculum.find(params[:id])
    @assignments = @curriculum.assignments
  end

  def complete
    @user = current_user
    @curricula = Curriculum.where(user_id: @user)
    @curricula.each do |curriculum|
      if curriculum.assignments.size == curriculum.complete.count
        return true
      end
    end
  end

  protected

  def curriculum_params
    params.require(:curriculum).permit(:name, :id)
  end
end

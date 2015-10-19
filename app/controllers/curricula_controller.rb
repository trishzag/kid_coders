class CurriculaController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_admin!, except: [:index, :show]

  def index
    @curricula = Curriculum.order(name: :asc)
  end

  def show
    @curriculum = Curriculum.find(params[:id])
    @assignments = @curriculum.assignments
  end

  protected

  def curriculum_params
    params.require(:curriculum).permit(:name, :id)
  end
end

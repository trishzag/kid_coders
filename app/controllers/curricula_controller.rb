class CurriculaController < ApplicationController
  def index
    @curricula = Curriculum.order(name: :asc)
  end

  def show
    @curriculum = Curriculum.find(params[:id])
  end

  protected

  def curriculum_params
    params.require(:curriculum).permit(:name, :id)
  end
end

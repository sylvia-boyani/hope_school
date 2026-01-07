class Admin::LevelsController < Admin::BaseController
  before_action :set_level, only: %i[edit update destroy]

  def index
    @levels = Level.order(:order)
  end

  def new
    @level = Level.new
  end

  def create
    @level = Level.new(level_params)
    if @level.save
      redirect_to admin_levels_path, notice: "Level created successfully."
    else
      render :new
    end
  end

  def edit; end

  def show
    @level = Level.find(params[:id])
    @subjects = Subject.all # All possible subjects
  end

  def update_subjects
  @level = Level.find(params[:id])
  # This magic line syncs the checkboxes to the database
  @level.subject_ids = params[:subject_ids]
  redirect_to admin_level_path(@level), notice: "Subjects updated for #{@level.name}"
  end

  def update
    if @level.update(level_params)
      redirect_to admin_levels_path, notice: "Level updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @level.destroy
    redirect_to admin_levels_path, notice: "Level deleted successfully."
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end

  def level_params
    params.require(:level).permit(:name, :order)
  end
end

class Admin::TeachersController < Admin::BaseController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  def index
    @teachers = Teacher.all
  end

  def show; end

  def new
    @teacher = Teacher.new
  end

  def edit; end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teachers_path, notice: "Teacher was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teachers_path, notice: "Teacher updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher.destroy
    redirect_to admin_teachers_path, notice: "Teacher removed."
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    # We permit :subject_id here so we can assign a subject to a teacher
    params.require(:teacher).permit(:name, :email, :phone, :bio, :subject_id)
  end
end
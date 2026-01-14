class Admin::TeachersController < Admin::BaseController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  def index
    @teachers = Teacher.all
  end

  def show; end

  def new
    @teacher = Teacher.new
    3.times { @teacher.teaching_assignments.build } # Shows 3 assignment slots
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
  redirect_to admin_teachers_path, status: :see_other, notice: "Teacher account has been permanently removed."
end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

def teacher_params
  params.require(:teacher).permit(
    :first_name, :last_name, :email, :phone, :bio,
    teaching_assignments_attributes: [:id, :subject_id, :class_room_id, :_destroy]
  )
end
end
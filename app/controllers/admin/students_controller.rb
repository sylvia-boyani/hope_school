class Admin::StudentsController < Admin::BaseController
  # Added :show to the before_action
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.includes(:level).order(created_at: :desc)
  end

  def show
  end 

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      # Redirecting to the index is usually better for school admins
      redirect_to admin_students_path, notice: "Student #{@student.first_name} #{@student.last_name} was successfully registered."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @student.update(student_params)
      redirect_to admin_students_path, notice: "Student record updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    redirect_to admin_students_path, notice: "Student removed from registry."
  end
  
  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
  params.require(:student).permit(
    :first_name, 
    :last_name, 
    :admission_number, 
    :date_of_birth, 
    :gender, 
    :level_id,
    :class_room_id,
    :photo
  )
 end
end
class Admin::StudentsController < Admin::BaseController
  before_action :set_student, only: %i[edit update destroy ]

  def index
    @students = Student.includes(:level).all
  end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_student_path, notice: "Student was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      redirect_to admin_student_path, notice: "Student updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    redirect_to admin_student_path, notice: "Student removed."
  end
  
  private

  def student_params
    # Ensure :level_id is permitted so you can assign them to a Grade
    params.require(:student).permit(:name, :admission_no, :level_id)
  end
end
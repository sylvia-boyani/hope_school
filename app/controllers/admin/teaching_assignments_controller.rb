class Admin::TeachingAssignmentsController < Admin::BaseController
  def create
    @assignment = TeachingAssignment.new(assignment_params)
    if @assignment.save
      redirect_to admin_teacher_path(@assignment.teacher), notice: "Assignment added."
    else
      redirect_to admin_teacher_path(@assignment.teacher), alert: "Unable to add assignment."
    end
  end

  def destroy
    @assignment = TeachingAssignment.find(params[:id])
    teacher = @assignment.teacher
    @assignment.destroy
    redirect_to admin_teacher_path(teacher), notice: "Assignment removed."
  end

  private

  def assignment_params
    params.require(:teaching_assignment).permit(:teacher_id, :subject_id, :class_room_id)
  end
end
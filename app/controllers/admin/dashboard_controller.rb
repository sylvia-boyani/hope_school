class Admin::DashboardController < Admin::BaseController
  def index
    @students_count   = Student.count
    @teachers_count   = Teacher.count
    @class_rooms_count = ClassRoom.count
    @levels_count     = Level.count
    @subjects_count   = Subject.count
    @pending_admissions = Admission.where(status: "pending").count
    @recent_admissions = Admission.order(created_at: :desc).limit(5)
  end
end

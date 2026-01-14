class Admin::AssessmentsController < Admin::BaseController
  def index
    @assessments = Assessment.includes(:student, :subject, :level).order(created_at: :desc)
  end

  def new
    @levels = Level.all
    
    # If the user has selected a level, filter subjects and students
    if params[:level_id].present?
      @level = Level.find(params[:level_id])
      @subjects = @level.subjects
      @students = @level.students
    else
      @subjects = []
      @students = []
    end
  end

  def create
    # Extract the common data
    level_id = params[:level_id]
    subject_id = params[:subject_id]
    term = params[:term]
    year = Time.current.year

    # Loop through the array of student scores sent from the form
    params[:assessments].each do |student_id, assessment_data|
      status = assessment_data[:status]
      
      # Only save if a performance level was actually selected
      if status.present?
        Assessment.create!(
          student_id: student_id,
          subject_id: subject_id,
          level_id: level_id,
          term: term,
          academic_year: year,
          status: status
        )
      end
    end

    redirect_to admin_assessments_path, notice: "CBC Assessments recorded successfully!"
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_admin_assessment_path, alert: "Error saving assessments: #{e.message}"
  end
end
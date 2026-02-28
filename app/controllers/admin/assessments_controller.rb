class Admin::AssessmentsController < Admin::BaseController
  
    def index
      @assessments = Assessment.includes(:student, :subject).order(assessment_date: :desc)
    end

    def new
      @assessment = Assessment.new
      # We need to fetch all three for the dropdowns
      @students = Student.all 
      @subjects = Subject.all
      @levels = Level.all 
    end

    def create
      @assessment = Assessment.new(assessment_params)
      if @assessment.save
        redirect_to admin_assessments_path, notice: "Assessment saved successfully!"
      else
        # If it fails, we MUST re-fetch these or the page crashes on re-render
        @students = Student.all
        @subjects = Subject.all
        @levels = Level.all
        render :new, status: :unprocessable_entity
      end
    end

    
    private

    def load_form_data
      @students = Student.all
      @subjects = Subject.all
    end

    # This is crucial for security!
    def assessment_params
      params.require(:assessment).permit(:student_id, :subject_id, :level_id, :performance_level, :assessment_date)
    end
end
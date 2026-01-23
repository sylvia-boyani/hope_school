class Admin::AssessmentsController < Admin::BaseController
  def index
      @assessments = Assessment.includes(:student, :subject, :level).order(assessment_date: :desc)
    end

    def new
      @assessment = Assessment.new
      @students = Student.all
      @subjects = Subject.all
      @levels = Level.all
    end
end
class Admin::SubjectsController < Admin::BaseController
  before_action :set_subject, only: %i[edit update destroy]

  def index
    # Includes level so we can see if it's "Grade 1" or "Grade 7" without extra DB hits
    @subjects = Subject.includes(:level).order("levels.name ASC, subjects.name ASC")
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params) # Fixed the typo here
    if @subject.save
      redirect_to admin_subjects_path, notice: "Subject created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @subject.update(subject_params)
      redirect_to admin_subjects_path, notice: "Subject updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
    redirect_to admin_subjects_path, notice: "Subject deleted successfully."
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    # Added :level_id so you can actually link the subject to a CBC Grade
    params.require(:subject).permit(:name, :order, :level_id)
  end
end
class Admin::SubjectsController < Admin::BaseController
  before_action :set_subject, only: %i[show edit update destroy]

  def index
    @subjects = Subject.order(:order)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(level_params)
    if @subject.save
      redirect_to admin_subjects_path, notice: "Subject created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update(subject_params)
      redirect_to admin_subjects_path, notice: "Subject updated successfully."
    else
      render :edit
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
    params.require(:subject).permit(:name, :order)
  end
end

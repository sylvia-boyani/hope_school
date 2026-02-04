class Admin::AdmissionsController < Admin::BaseController
  before_action :set_admission, only: %i[edit update destroy]

  def index
    @admissions = Admission.includes(:class_room).order(created_at: :desc)
  end

  def new
    @admission = Admission.new
  end

  def create
  @admission = Admission.new(admission_params)
  if @admission.save
    redirect_to admin_admissions_path, notice: "Admission created successfully!"
  else
    # This part is why the page "does nothing" — it's just re-rendering the form with errors
    render :new, status: :unprocessable_entity
  end
end

  def edit; end

  def update
    if @admission.update(admission_params)
      redirect_to admin_admissions_path, notice: "Admission updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @admission.destroy
    redirect_to admin_admissions_path, notice: "Admission deleted successfully."
  end

  private

  def set_admission
    @admission = Admission.find(params[:id])
  end

 def admission_params
  params.require(:admission).permit(
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

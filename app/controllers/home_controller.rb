class HomeController < ApplicationController
  def index
  end

  def about
  end

  def programs
  end

  def admissions
  end

  def contact
  end

  def create_inquiry
  # This triggers the email
  inquiry_params = {
    name: params[:name],
    phone: params[:phone],
    email: params[:email], # Capture the email here
    grade: params[:grade],
    message: params[:message]
  }
  
  InquiryMailer.school_inquiry(params).deliver_now
  
  redirect_to contact_path, notice: "Thank you! Your inquiry has been sent to our admissions team."
  end
end

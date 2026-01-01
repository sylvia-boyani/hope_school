class InquiryMailer < ApplicationMailer
  # Change this to your actual Gmail address used in SMTP settings
  default from: "boyani.ombogo7@gmail.com"

  def school_inquiry(params)
    @name    = params[:name]
    @email   = params[:email] # The parent's email
    @phone   = params[:phone]
    @grade   = params[:grade]
    @message = params[:message]

    # You can keep the 'to' as your own email for testing
    mail(to: "boyani.ombogo7@gmail.com", subject: "Hope School Inquiry: #{@name}")
  end
end

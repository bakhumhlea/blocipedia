class ConfirmationsMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  
  def confirmation_instructions(user)
    headers["Custom-header"] = "Confirm Your Email"
    headers["In-Reply-To"] = "<no-reply@blocipedia.com>"
    
    @user = user
     
    mail(to: @user.email, subject: "Confirm your email: #{@user.email}")
    
    super
  end
end
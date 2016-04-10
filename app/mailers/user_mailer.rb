class UserMailer < ApplicationMailer
  # Need to have this in here so that the mailer can use teh helper
  add_template_helper(BasketsHelper)

  default from: "do-not-reply@example.com"

  def contact_email(contact)
    @contact = contact
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, :subject =>
    "Website Contact")
  end

  def basket_response_email(response)
    @response = response
    mail(to: Rails.application.secrets.owner_email, :subject => "Basket response")
    # mail(to: ["mark.booth@civica.co.uk", Rails.application.secrets.owner_email],
    #      subject: "Basket response")
  end

end

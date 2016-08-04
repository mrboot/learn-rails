class UserMailer < ApplicationMailer
  # Need to have this in here so that the mailer can use the helper
  add_template_helper(BasketsHelper)

  default from: "do-not-reply@mbmakes.com"

  def contact_email(contact)
    @contact = contact
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, :subject =>
    "Website Contact")
  end

  def full_basket_response_email(response)
    @response = response
    # mail(to: Rails.application.secrets.owner_email, :subject => "Basket response")
    mail(to: ["mark.booth@civica.co.uk", Rails.application.secrets.owner_email],
         subject: "Basket response")
  end

  def single_basket_response_email(response)
    @response = response
    # mail(to: Rails.application.secrets.owner_email, :subject => "Basket response")
    mail(to: ["mark.booth@civica.co.uk", Rails.application.secrets.owner_email],
         subject: "Basket response")
  end

  def item_response_email(response)
    @response = response
    # mail(to: Rails.application.secrets.owner_email, :subject => "Item response")
    mail(to: ["mark.booth@civica.co.uk", Rails.application.secrets.owner_email],
         subject: "Item response")
  end

end

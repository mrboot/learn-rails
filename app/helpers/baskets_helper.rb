module BasketsHelper

  def message_format(msg)
    if msg.has_key?("NotificationMessage")
      render 'user_mailer/full_notification'
    else
      render 'user_mailer/single_notification'
    end  
  end

end

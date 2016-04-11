module BasketsHelper

  # def message_format(msg)
  #   if msg.has_key?("NotificationMessage")
  #     render 'user_mailer/full_notification'
  #   else
  #     render 'user_mailer/single_notification'
  #   end
  # end

  def message_format(msg)
    @msg_body = msg
    if @msg_body.has_key?("NotificationMessage")
      if @msg_body["NotificationMessage"]["ListItems"]["ListItem"].is_a?(Array)
        UserMailer.full_basket_response_email(@msg_body).deliver
      else
        UserMailer.single_basket_response_email(@msg_body).deliver
      end
    else
      UserMailer.item_response_email(@msg_body).deliver
    end
  end

end

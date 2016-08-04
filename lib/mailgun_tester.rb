# need to have gem mailgun-ruby installed for this to work.
require 'mailgun'

# First, instantiate the Mailgun Client with your API key
mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']

# Define your message parameters
message_params = {:from    => 'Mailgun mbmakes domain <postmaster@mg.mbmakes.com>',
                  :to      => 'Mark Booth <mark.booth@civica.co.uk>',
                  # :to      => 'Mark Booth <mrbooth@gmail.com>',
                  :subject => 'Test Mailgun email',
                  :text    => 'It is really easy to send a message!'}

# Send your message through the client
mg_client.send_message "mg.mbmakes.com", message_params

# getting events
# mg_events = Mailgun::Events.new(mg_client, "mg.mbmakes.com")
#
# result = mg_events.get({'limit' => 25,
#                         'recipient' => 'mrbooth@gmail.com'})
#
# result.to_h['items'].each do | item |
#     # outputs "Delivered - 20140509184016.12571.48844@example.com"
#     puts "#{item['event']} - #{item['message']['headers']['message-id']}"
# end

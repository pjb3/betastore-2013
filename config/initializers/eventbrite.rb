eb_auth_tokens = { app_key: ENV['EVENTBRITE_APP_KEY'],
                   user_key: ENV['EVENTBRITE_USER_KEY'] }
$eb_client = EventbriteClient.new(eb_auth_tokens)

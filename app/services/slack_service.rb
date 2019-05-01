class SlackNotifier
  # constructor
  # use as: SlackNotifier.new "YOUR-URL"
  def initialize(username = "WackRank", icon_emoji = ":table_tennis_paddle_and_ball:")
    @webhook_url = ENV["SLACK_WEBHOOK_URL"]
    @username = username
    @icon_emoji = icon_emoji
  end

  # sends a notification
  # returns true after a successfull pust
  def send(text)
    return unless @webhook_url

    # send as json
    headers = { 'Content-Type' => 'application/json' }
    # payload
    body = { "text": text, "icon_emoji": @icon_emoji, username: @username}

    # rescue from request errors
    begin
      # make request
      r = HTTParty.post(@webhook_url, body: body.to_json, headers: headers )
      return (r.code == 200)
    rescue
      return false
    end
  end
end

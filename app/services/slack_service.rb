class SlackNotifier
  def initialize(icon_emoji = ":table_tennis_paddle_and_ball:")
    @webhook_url = ENV["SLACK_WEBHOOK_URL"]
    @icon_emoji = icon_emoji
  end

  def send(text)
    puts "About to create slack message"
    puts @webhook_url
    return unless @webhook_url
    


    headers = { 'Content-Type' => 'application/json' }
    body = { "text": text, "icon_emoji": @icon_emoji}

    begin
      r = HTTParty.post(@webhook_url, body: body.to_json, headers: headers )
      puts r.code
      puts "Created slack message"

      return (r.code == 200)
    rescue
      return false
    end
  end
end

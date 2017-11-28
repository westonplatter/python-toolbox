# slack.rb

Slack.configure do |config|
  config.token = ENV['slack_bot']
end

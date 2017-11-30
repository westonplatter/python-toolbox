class PingSlackJob
  include Sidekiq::Worker

  sidekiq_options \
    :queue => :slack

  def perform(msg)
    return if Rails.env.development?

    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#pt-production', text: msg, as_user: true)
  end
end

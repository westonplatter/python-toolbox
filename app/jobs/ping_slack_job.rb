class PingSlackWorker
  include Sidekiq::Worker

  sidekiq_options \
    :queue => :slack

  def perform(msg)
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#pt-production', text: msg, as_user: true)
  end
end

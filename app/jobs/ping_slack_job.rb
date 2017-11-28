class PingSlackWorker
  include Sidekiq::Worker

  def perform(msg)
    client = Slack::Web::Client.new
    client.chat_postMessage(channel: '#pt-production-nxs', text: msg, as_user: true)
  end
end

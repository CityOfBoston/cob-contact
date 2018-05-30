class SubscribeWorker
  include Sidekiq::Worker

  def perform(profile_id, list)
    bot = SubscribeBot.new

    subscriber = Subscriber.find_by!(profile_id: profile_id)

    response = bot.subscribe(subscriber, list)

    puts response.to_yaml
  end
end

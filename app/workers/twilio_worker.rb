class TwilioWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  sidekiq_retries_exhausted do |msg|
    Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}."
  end

  def perform(user_id)
    user = User.find(user_id)
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @client.account.messages.create(
    :from => '+19842028806',
    :to => user.phone,
    :body => 'Thanks for signing up!'
    )
  end
end
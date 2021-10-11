class SendMessageWorker
  include Sidekiq::Worker

  def perform(*args)
    p 'bla'
  end
end
class HardWorker
  include Sidekiq::Worker

  def perform(call_me)
    perform_in(1.minutes, 'bob', 5)
  end
end

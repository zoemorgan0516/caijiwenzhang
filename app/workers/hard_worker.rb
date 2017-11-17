
class HardWorker
  include Sidekiq::Worker

  def perform(hhh)
    puts "======"
  end

end

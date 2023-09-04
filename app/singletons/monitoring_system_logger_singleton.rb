class MonitoringSystemLoggerSingleton
  include Singleton

  def initialize
    @logger = Logger.new(Rails.root.join('log', 'monitoring_system.log'))
  end

  def warn(message)
    @logger.warn(message)
  end

  def info(message)
    @logger.info(message)
  end
end

class BaseComposite
  def initialize
    @tasks = []
  end

  def add_task(task:)
    @tasks << task
  end

  def call
    @tasks.each(&:call)
  end
end

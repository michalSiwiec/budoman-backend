class BaseBuilder
  def self.handle(*args)
    new(*args).build
  end
end

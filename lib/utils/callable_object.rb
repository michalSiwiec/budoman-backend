module Utils
  module CallableObject
    def call(**args)
      new(**args).call
    end
  end
end

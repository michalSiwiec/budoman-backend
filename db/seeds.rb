SEED_GENERATORS_NAMES = %w[Users Opinions ProductCathegories Products]

SEED_GENERATORS_NAMES.each do |name|
  "SeedGenerator::#{name}".constantize.call
end

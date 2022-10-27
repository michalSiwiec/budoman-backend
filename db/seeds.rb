%w[Users Opinions ProductCathegories Products].each { |seeds_name| "SeedGenerator::#{seeds_name}".constantize.call }

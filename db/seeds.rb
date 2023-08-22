%w[Users Opinions ProductCategories Products].each { |seeds_name| "SeedGenerator::#{seeds_name}Service".constantize.call }

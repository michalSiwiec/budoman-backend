%w[Users Opinions ProductCategories Products].each { |seeds_name| "Services::SeedGenerator::#{seeds_name}Service".constantize.call }

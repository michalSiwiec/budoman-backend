require './lib/services/seed_generator/users_service'
require './lib/services/seed_generator/opinions_service'
require './lib/services/seed_generator/product_categories_service'
require './lib/services/seed_generator/products_service'

%w[Users Opinions ProductCategories Products].each { |seeds_name| "SeedGenerator::#{seeds_name}Service".constantize.new.call }

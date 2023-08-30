class AddConstraintsForProductCategories < ActiveRecord::Migration[5.2]
  def up
    change_column_null :product_categories, :name, false

    execute <<-SQL
      ALTER TABLE product_categories
      ADD CONSTRAINT name_length_check
      CHECK (length(name) > 0);
    SQL
  end

  def down
    change_column_null :product_categories, :name, true

    execute <<-SQL
      ALTER TABLE product_categories
      DROP CONSTRAINT name_length_check;
    SQL
  end
end

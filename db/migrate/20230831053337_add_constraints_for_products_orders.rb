class AddConstraintsForProductsOrders < ActiveRecord::Migration[5.2]
  def up
    change_column_null :products_orders, :order_id, false
    change_column_null :products_orders, :product_id, false
    change_column_null :products_orders, :product_quantity, false

    execute <<-SQL
      ALTER TABLE products_orders
      ADD CONSTRAINT product_quantity_check
      CHECK (product_quantity >= 0);
    SQL
  end

  def down
    change_column_null :products_orders, :order_id, false
    change_column_null :products_orders, :product_id, false
    change_column_null :products_orders, :product_quantity, true

    execute <<-SQL
      ALTER TABLE products_orders
      DROP CONSTRAINT product_quantity_check;
    SQL
  end
end

# frozen_string_literal: true

class AddProductQuantityToProductsOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :products_orders, :product_quantity, :integer
  end
end

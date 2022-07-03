class AddPromotionColumnsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :promoted_from, :datetime
    add_column :products, :promoted_to, :datetime
  end
end

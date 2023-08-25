class RenameProductCathegoriesToProductCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :product_cathegories, :product_categories

    remove_foreign_key :products, column: :product_cathegory_id
    rename_column :products, :product_cathegory_id, :product_category_id
    add_foreign_key :products, :product_categories, column: :product_category_id
  end
end

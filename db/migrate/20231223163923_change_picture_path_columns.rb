class ChangePicturePathColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :picture_key, :string, limit: 120, null: false
    add_column :products, :picture_bucket, :string, limit: 120, null: false
    remove_column :products, :picture_path
  end
end

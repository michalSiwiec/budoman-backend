class ChangePicturePathColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :picture_key, :string, limit: 120, null: false, default: 'Temporary value'
    add_column :products, :picture_bucket, :string, limit: 120, null: false, default: 'Temporary value'
    remove_column :products, :picture_path
    change_column_default :products, :picture_key, from: 'Temporary value', to: nil
    change_column_default :products, :picture_bucket, from: 'Temporary value', to: nil
  end
end

# frozen_string_literal: true

class ChangePictureToPicturePathInProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column(:products, :picture, :picture_path)
  end
end

# frozen_string_literal: true

class AddOrderFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :phone_number, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
  end
end

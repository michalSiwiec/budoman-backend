class AddDefaultValueToAvatarsInsideUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :avatars, from: nil, to: []
  end
end

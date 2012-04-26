class AddUserIdToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :user_id, :integer
  end
end

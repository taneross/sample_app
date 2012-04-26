class AddCreatorIdToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :creator_id, :integer
  end
end

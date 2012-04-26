class RemoveCreatorIdFromTrails < ActiveRecord::Migration
  def up
    remove_column :trails, :creator_id
      end

  def down
    add_column :trails, :creator_id, :integer
  end
end

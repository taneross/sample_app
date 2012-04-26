class RemoveTrailsFromRelationships < ActiveRecord::Migration
  def up
    remove_column :relationships, :creator_id
        remove_column :relationships, :trail_id
      end

  def down
    add_column :relationships, :trail_id, :integer
    add_column :relationships, :creator_id, :integer
  end
end

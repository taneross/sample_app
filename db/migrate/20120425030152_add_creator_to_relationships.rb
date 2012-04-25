class AddCreatorToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :creator_id, :integer
    add_column :relationships, :trail_id, :integer
  end
end

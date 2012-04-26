class AddCreationIdToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :creation_id, :integer
  end
end

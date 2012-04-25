class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :title
      t.text :description
      t.string :twitter
      t.string :category

      t.timestamps
    end
  end
end

class CreatePlacements < ActiveRecord::Migration[6.0]
  def change
    create_table :placements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.boolean :confirmed

      t.timestamps
    end
  end
end

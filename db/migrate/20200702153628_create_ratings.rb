class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :worker_id
      t.integer :manager_id
      t.references :placement, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.date :start_date
      t.date :end_date
      t.integer :wage
      t.integer :capacity
      t.text :description
      t.string :job_type
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end

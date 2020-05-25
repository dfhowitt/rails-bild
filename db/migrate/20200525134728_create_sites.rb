class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :location
      t.string :site_type
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

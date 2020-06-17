class AddLocationToSites < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :location, :string
  end
end

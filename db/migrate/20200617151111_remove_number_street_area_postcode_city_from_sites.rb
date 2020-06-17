class RemoveNumberStreetAreaPostcodeCityFromSites < ActiveRecord::Migration[6.0]
  def change
    remove_column :sites, :number, :integer
    remove_column :sites, :street, :string
    remove_column :sites, :area, :string
    remove_column :sites, :postcode, :string
    remove_column :sites, :city, :string
  end
end

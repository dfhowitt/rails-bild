class AddCompanyToSites < ActiveRecord::Migration[6.0]
  def change
    add_reference :sites, :company, foreign_key: true
  end
end

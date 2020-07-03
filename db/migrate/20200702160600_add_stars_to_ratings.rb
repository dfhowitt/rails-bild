class AddStarsToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :stars, :integer
  end
end

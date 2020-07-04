class AddStarRatingToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :star_rating, :integer
  end
end

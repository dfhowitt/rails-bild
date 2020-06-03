class AddPlacementToConversations < ActiveRecord::Migration[6.0]
  def change
    add_reference :conversations, :placement, null: true, foreign_key: true
  end
end

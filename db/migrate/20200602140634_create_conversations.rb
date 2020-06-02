class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.integer :worker_id
      t.integer :manager_id

      t.timestamps
    end
  end
end

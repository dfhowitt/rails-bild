class CreateUserQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_qualifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :qualification, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProjectQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :project_qualifications do |t|
      t.references :qualification, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

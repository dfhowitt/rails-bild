class ProjectQualification < ApplicationRecord
  belongs_to :qualification
  belongs_to :project
  validates :project_id, uniqueness: { scope: :qualification_id, message: "You cannot upload the same qualification twice!" }
end

class UserQualification < ApplicationRecord
  belongs_to :user
  belongs_to :qualification
  validates :user_id, uniqueness: { scope: :qualification_id, message: "You cannot upload the same qualification twice!" }
end

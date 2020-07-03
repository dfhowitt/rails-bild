class Placement < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :conversation, dependent: :destroy
  has_one :rating, dependent: :destroy
  validates :user_id, uniqueness: { scope: :project_id, message: "You cannot apply to the same job twice!" }
end

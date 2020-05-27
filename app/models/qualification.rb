class Qualification < ApplicationRecord
  has_many :user_qualifications, dependent: :destroy
  has_many :project_qualifications, dependent: :destroy
  validates :name, presence: true
end

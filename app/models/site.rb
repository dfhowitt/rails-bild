class Site < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :placements, through: :projects
  has_many :users, through: :placements
  validates :location, presence: true
  validates :name, presence: true
  validates :site_type, presence: true

  def geocode_location?

  end
end

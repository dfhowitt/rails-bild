class Site < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :placements, through: :projects
  has_many :users, through: :placements
  has_one_attached :photo
  validates :location, presence: true
  validates :name, presence: true
  validates :site_type, presence: true


  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  SITE_TYPES = ['Commercial', 'Residential', 'Industrial']

  def geocode_location?

  end
end

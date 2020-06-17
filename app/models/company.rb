class Company < ApplicationRecord
  has_many :sites, dependent: :destroy
  has_many :projects, through: :sites
  has_many :placements, through: :projects
  has_many :users, through: :placements
  has_one_attached :photo
  validates :name, presence: true
end

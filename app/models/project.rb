class Project < ApplicationRecord
  belongs_to :site
  has_many :placements, dependent: :destroy
  has_many :users, through: :placements
  has_many :project_qualifications, dependent: :destroy
  has_many :qualifications, through: :project_qualifications
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :wage, presence: true
  validate :end_date_not_before_than_start_date
  validates :capacity, presence: true
  validates :description, presence: true
  validates :job_type, presence: true

  # include PgSearch::Model
  # multisearchable against: [:wage, :start_date, :end_date]

  def end_date_not_before_than_start_date
    if start_date > end_date
      errors.add(end_date, "End date cannot be earlier than the start date")
    end
  end
end

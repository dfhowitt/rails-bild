class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :placements, dependent: :destroy
  has_many :user_qualifications, dependent: :destroy
  has_many :qualifications, through: :user_qualifications
  has_many :projects, through: :placements
  has_many :sites, through: :projects
  has_many :managed_sites, class_name: :Site, foreign_key: :user_id
  has_many :managed_projects, through: :managed_sites, class_name: :Project, foreign_key: :site_id, source: :projects
  has_many :managed_placements, through: :managed_projects, class_name: :Placement, foreign_key: :project_id, source: :placements
  has_many :managed_users, through: :managed_placements, class_name: :User, foreign_key: :placement_id, source: :users
  has_many :messages, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  has_one :profile
  has_one_attached :avatar

end

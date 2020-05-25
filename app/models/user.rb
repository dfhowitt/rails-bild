class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :placements, dependent: :destroy
  has_many :qualifications, through: :user_qualifications
  has_many :projects, through: :placements
  has_many :sites, through: :projects
  has_many :managed_sites, class_name: :Site, foreign_key: :user_id
  # validates :name, presence: true
  # validates :phone_number, presence: true
end

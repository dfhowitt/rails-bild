class Business < ApplicationRecord
  belongs_to :user
  has_many :employments, dependent: :destroy
end

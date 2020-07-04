class Rating < ApplicationRecord
  belongs_to :worker, foreign_key: :worker_id, class_name: 'User'
  belongs_to :manager, foreign_key: :manager_id, class_name: 'User'
  belongs_to :placement
  validates :star_rating, presence: true, inclusion: { in: 0..5 }

  scope :between, -> (worker_id, manager_id) do
    where('(ratings.worker_id = ? AND ratings.manager_id =?) OR (ratings.worker_id = ? AND ratings.manager_id =?)', worker_id, manager_id, worker_id, manager_id)
  end
end

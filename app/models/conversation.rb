class Conversation < ApplicationRecord
  belongs_to :worker, foreign_key: :worker_id, class_name: 'User'
  belongs_to :manager, foreign_key: :manager_id, class_name: 'User'
  belongs_to :placement
  has_many :messages, dependent: :destroy

  scope :between, -> (worker_id, manager_id) do
    where('(conversations.worker_id = ? AND conversations.manager_id =?) OR (conversations.worker_id = ? AND conversations.manager_id =?)', worker_id, manager_id, worker_id, manager_id)
  end
end

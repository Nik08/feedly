class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  validates :status_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }

end

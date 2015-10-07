class Userplan < ActiveRecord::Base
  belongs_to :user
  belongs_to :curriculum
  validates :user_id, presence: true, numericality: true
  validates :curriculum_id, presence: true, numericality: true
  validates :user_id, uniqueness: { scope: :curriculum_id }
end

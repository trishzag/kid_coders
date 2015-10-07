class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :assignment_id, presence: true, numericality: true
end

class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment

  validates :name, presence: true
  validates :name, inclusion: { in: ["Pass", "Requires Work", "In Progress"] }
  validates :user_id, presence: true
  validates :assignment_id, presence: true, numericality: true
end

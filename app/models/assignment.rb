class Assignment < ActiveRecord::Base
  belongs_to :curriculum
  has_many :resources
  has_many :contents
  validates :title, presence: true, uniqueness: true
  validates :curriculum_id, presence: true
  validates :curriculum_id, numericality: true
  message = "has already entered this assignment."
  validates :title, uniqueness: { scope: :curriculum_id, message: message }
end

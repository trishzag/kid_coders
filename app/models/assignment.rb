class Assignment < ActiveRecord::Base
  belongs_to :curriculum
  has_many :resources
  has_many :contents
  has_many :grades
  validates :title, presence: true, uniqueness: true
  validates :curriculum_id, presence: true
  validates :curriculum_id, numericality: true
  validates :title, uniqueness: { scope: :curriculum_id }
end

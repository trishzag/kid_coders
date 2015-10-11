class Assignment < ActiveRecord::Base
  belongs_to :curriculum
  has_many :resources, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :grades, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :title, length: { in: 4..40 }
  validates :curriculum_id, presence: true
  validates :curriculum_id, numericality: true
  validates :title, uniqueness: { scope: :curriculum_id }
end

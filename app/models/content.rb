class Content < ActiveRecord::Base
  belongs_to :assignment
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :source, presence: true
  validates :assignment_id, presence: true, numericality: true
  validates :title, uniqueness: { scope: :assignment_id }
end

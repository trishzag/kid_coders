class Curriculum < ActiveRecord::Base
  has_many :assignments
  validates :name, presence: true, uniqueness: true
  validates :name, uniqueness: { scope: :id }
end

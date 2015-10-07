class Curriculum < ActiveRecord::Base
  has_many :assignments
  has_many :userplans
  has_many :users, through: :userplans
  validates :name, presence: true, uniqueness: true
  validates :name, uniqueness: { scope: :id }
end

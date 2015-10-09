class Curriculum < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :userplans, dependent: :destroy
  has_many :users, through: :userplans
  validates :name, presence: true, uniqueness: true
  validates :name, uniqueness: { scope: :id }
end
